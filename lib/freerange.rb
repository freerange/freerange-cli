require 'rubygems'
require 'thor'

module FreeRange
  MEMBERS = {
    'james.adam' => 'James Adam',
    'james.andrews' => 'James Andrews',
    'james.mead' => 'James Mead',
    'jason.cale' => 'Jason Cale',
    'luke.redpath' => 'Luke Redpath',
    'kalvir.sandhu' => 'Kalvir Sandhu',
    'tom.ward' => 'Tom Ward'
  }
  
  class CLI < Thor
    class Pair
      def initialize(pair)
        @pair = pair
        owner_name = `git config --global --get user.name`.strip
        @owner = MEMBERS.keys.detect {|x| MEMBERS[x] == owner_name }
      end

      def name
        [MEMBERS[@pair], MEMBERS[@owner]].sort.join(" & ")
      end

      def email
        [@owner, @pair].sort.join('+') + "+pairing@gofreerange.com"
      end
    end

    desc 'members', 'Lists freerange members'
    def members
      MEMBERS.keys.sort.each {|name| puts name }
    end
    
    desc 'pair NAME', 'Changes who you are pairing with'
    method_options :show => :boolean
    def pair(author)
      p = Pair.new(author)
      set 'user.name' => p.name, 'user.email' => p.email
    end
    
    desc 'unpair', 'Stop pairing'
    def unpair
      unset 'user.name', 'user.email'
    end

    private

    def set(options = {})
      options.each do |key, value|
        `git config #{key} '#{value}'`
      end
    end

    def unset(*options)
      options.each {|o| `git config --unset #{o}`}
    end
  end
end

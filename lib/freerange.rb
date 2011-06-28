require 'rubygems'
require 'thor'

module FreeRange
  MEMBERS = {
    'chris.roos' => 'Chris Roos',
    'james.adam' => 'James Adam',
    'james.mead' => 'James Mead',
    'jason.cale' => 'Jason Cale',
    'kalvir.sandhu' => 'Kalvir Sandhu',
    'tom.ward' => 'Tom Ward'
  }
  
  class CLI < Thor
    class Pair
      def initialize(pair)
        @pair = pair
        owner_name = `git config --global --get user.name`.strip
        @owner = MEMBERS.keys.detect {|x| MEMBERS[x] == owner_name }
        raise "You can't pair with yourself." if @pair == @owner
      end

      def name
        [MEMBERS[@pair], MEMBERS[@owner]].sort.join(" & ")
      end

      def email
        "pairing+" + [@owner, @pair].sort.join('+') + "@gofreerange.com"
      end

      def initials
        @pair.split(".").collect {|p| p[0..0]}.join
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
      set 'user.name' => p.name, 'user.email' => p.email, 'pair.initials' => p.initials
    rescue => e
      puts e.message
      exit(-1)
    end
    
    desc 'unpair', 'Stop pairing'
    def unpair
      unset 'user.name', 'user.email', 'pair.initials'
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

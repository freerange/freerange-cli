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
    desc 'pair NAME', 'Changes who you are pairing with'
    method_options :show => :boolean
    def pair(author)
      owner_name = `git config --global --get user.name`.strip
      owner = MEMBERS.keys.detect {|x| MEMBERS[x] == owner_name }
      pair = [MEMBERS[owner], MEMBERS[author]].sort
      `git config user.name '#{pair.join(" & ")}'`
      `git config user.email '#{[owner,author].sort.join('+')}+pairing@gofreerange.com'`
    end
    
    desc 'unpair', 'Stop pairing'
    def unpair
      `git config --unset user.name`
      `git config --unset user.email`
    end
  end
end

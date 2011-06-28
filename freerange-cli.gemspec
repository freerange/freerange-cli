# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{freerange-cli}
  s.version = "0.0.14"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Tom Ward}]
  s.date = %q{2011-06-28}
  s.email = %q{tom.ward@gofreerange.com}
  s.executables = [%q{freerange}]
  s.files = [
    %q{.gitignore},
    %q{README},
    %q{Rakefile},
    %q{bin/freerange},
    %q{freerange-cli.gemspec},
    %q{lib/freerange.rb},
    %q{zsh/_freerange}
  ]
  s.homepage = %q{http://gofreerange.com}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Simple commands to help with Freerange}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0"])
    else
      s.add_dependency(%q<thor>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0"])
  end
end

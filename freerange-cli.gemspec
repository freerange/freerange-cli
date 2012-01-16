# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "freerange-cli"
  s.version = "0.0.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Ward"]
  s.date = "2012-01-16"
  s.email = "tom.ward@gofreerange.com"
  s.executables = ["freerange"]
  s.files = [
    ".gitignore",
    "README",
    "Rakefile",
    "bin/freerange",
    "freerange-cli.gemspec",
    "lib/freerange.rb",
    "zsh/_freerange"
  ]
  s.homepage = "http://gofreerange.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Simple commands to help with Freerange"

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

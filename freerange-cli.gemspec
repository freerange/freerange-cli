# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{freerange-cli}
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Ward"]
  s.date = %q{2010-06-09}
  s.default_executable = %q{freerange}
  s.email = %q{tom.ward@gofreerange.com}
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
  s.homepage = %q{http://gofreerange.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Simple commands to help with Freerange}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0"])
    else
      s.add_dependency(%q<thor>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0"])
  end
end

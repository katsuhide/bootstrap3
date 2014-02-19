# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "anjlab-bootstrap-rails"
  s.version = "3.0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yury Korolev"]
  s.date = "2013-12-05"
  s.description = "Bootstrap CSS (with Sass flavour) and JS toolkits for Rails 3 projects"
  s.email = ["yury.korolev@gmail.com"]
  s.homepage = "https://github.com/anjlab/bootstrap-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.0"
  s.summary = "Bootstrap CSS (with Sass flavour) and JS toolkits for Rails 3 projects"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_runtime_dependency(%q<sass>, [">= 3.2"])
      s.add_development_dependency(%q<bundler>, [">= 1.0"])
      s.add_development_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<sass>, [">= 3.2"])
      s.add_dependency(%q<bundler>, [">= 1.0"])
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<sass>, [">= 3.2"])
    s.add_dependency(%q<bundler>, [">= 1.0"])
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end

# -*- encoding: utf-8 -*-
# stub: loc 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "loc".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Cyrille Courti\u00E8re".freeze]
  s.date = "2020-03-09"
  s.email = ["cyrille@klaxit.com".freeze]
  s.homepage = "https://github.com/klaxit/loc".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Location handling & geographical computations".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_development_dependency(%q<byebug>.freeze, ["~> 9.0"])
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_dependency(%q<byebug>.freeze, ["~> 9.0"])
  end
end

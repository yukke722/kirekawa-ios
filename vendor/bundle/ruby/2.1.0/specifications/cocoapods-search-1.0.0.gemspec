# -*- encoding: utf-8 -*-
# stub: cocoapods-search 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cocoapods-search".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Eloy Dur\u{e1}n".freeze, "Fabio Pelosin".freeze, "Emma Koszinowski".freeze]
  s.date = "2016-05-10"
  s.description = "Search for pods.".freeze
  s.email = ["eloy.de.enige@gmail.com".freeze, "fabiopelosin@gmail.com".freeze, "emkosz@gmail.com".freeze]
  s.homepage = "https://github.com/CocoaPods/cocoapods-search".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.7".freeze
  s.summary = "Searches for pods, ignoring case, whose name matches `QUERY`. If the `--full` option is specified, this will also search in the summary and description of the pods.".freeze

  s.installed_by_version = "2.6.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end

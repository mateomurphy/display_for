# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "display_for"
  s.version = "0.1.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mateo Murphy"]
  s.date = "2013-03-19"
  s.description = "A Rails library for displaying data, in tabular and other formats"
  s.email = "mateo.murphy@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "display_for.gemspec",
    "lib/display_for.rb",
    "lib/display_for/builder.rb",
    "lib/display_for/builder/base.rb",
    "lib/display_for/builder/collection_base.rb",
    "lib/display_for/builder/csv.rb",
    "lib/display_for/builder/list.rb",
    "lib/display_for/builder/resource_base.rb",
    "lib/display_for/builder/table.rb",
    "lib/display_for/builder/view.rb",
    "lib/display_for/element.rb",
    "lib/display_for/element/action.rb",
    "lib/display_for/element/attribute.rb",
    "lib/display_for/element/base.rb",
    "lib/display_for/element/html.rb",
    "lib/display_for/helper.rb",
    "spec/lib/builder/list_spec.rb",
    "spec/lib/builder/table_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/test_model.rb",
    "spec/support/test_template.rb"
  ]
  s.homepage = "http://github.com/mateomurphy/display_for"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Rails library for displaying data"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.2.13"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3.4"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2.13"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.3.4"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2.13"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.3.4"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end


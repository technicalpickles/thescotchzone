# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{searchlogic}
  s.version = "2.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Johnson of Binary Logic"]
  s.date = %q{2009-11-05}
  s.description = %q{Searchlogic makes using ActiveRecord named scopes easier and less repetitive.}
  s.email = %q{bjohnson@binarylogic.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = [".gitignore", "CHANGELOG.rdoc", "LICENSE", "README.rdoc", "Rakefile", "VERSION.yml", "init.rb", "lib/searchlogic.rb", "lib/searchlogic/active_record/consistency.rb", "lib/searchlogic/active_record/named_scopes.rb", "lib/searchlogic/core_ext/object.rb", "lib/searchlogic/core_ext/proc.rb", "lib/searchlogic/named_scopes/alias_scope.rb", "lib/searchlogic/named_scopes/association_conditions.rb", "lib/searchlogic/named_scopes/association_ordering.rb", "lib/searchlogic/named_scopes/conditions.rb", "lib/searchlogic/named_scopes/or_conditions.rb", "lib/searchlogic/named_scopes/ordering.rb", "lib/searchlogic/rails_helpers.rb", "lib/searchlogic/search.rb", "rails/init.rb", "searchlogic.gemspec", "spec/core_ext/object_spec.rb", "spec/core_ext/proc_spec.rb", "spec/named_scopes/alias_scope_spec.rb", "spec/named_scopes/association_conditions_spec.rb", "spec/named_scopes/association_ordering_spec.rb", "spec/named_scopes/conditions_spec.rb", "spec/named_scopes/or_conditions_spec.rb", "spec/named_scopes/ordering_spec.rb", "spec/search_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/binarylogic/searchlogic}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{searchlogic}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Searchlogic makes using ActiveRecord named scopes easier and less repetitive.}
  s.test_files = ["spec/core_ext/object_spec.rb", "spec/core_ext/proc_spec.rb", "spec/named_scopes/alias_scope_spec.rb", "spec/named_scopes/association_conditions_spec.rb", "spec/named_scopes/association_ordering_spec.rb", "spec/named_scopes/conditions_spec.rb", "spec/named_scopes/or_conditions_spec.rb", "spec/named_scopes/ordering_spec.rb", "spec/search_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.0.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.0.0"])
  end
end

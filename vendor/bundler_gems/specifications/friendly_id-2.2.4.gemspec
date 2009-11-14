# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{friendly_id}
  s.version = "2.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Norman Clarke", "Adrian Mugnolo", "Emilio Tagua"]
  s.date = %q{2009-11-11}
  s.description = %q{A comprehensive slugging and pretty-URL plugin for Rails apps using ActiveRecord.}
  s.email = ["norman@njclarke.com", "adrian@mugnolo.com", "miloops@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "README.rdoc"]
  s.files = ["History.txt", "MIT-LICENSE", "README.rdoc", "Rakefile", "generators/friendly_id/friendly_id_generator.rb", "generators/friendly_id/templates/create_slugs.rb", "generators/friendly_id_20_upgrade/friendly_id_20_upgrade_generator.rb", "generators/friendly_id_20_upgrade/templates/upgrade_friendly_id_to_20.rb", "init.rb", "lib/friendly_id.rb", "lib/friendly_id/helpers.rb", "lib/friendly_id/non_sluggable_class_methods.rb", "lib/friendly_id/non_sluggable_instance_methods.rb", "lib/friendly_id/slug.rb", "lib/friendly_id/sluggable_class_methods.rb", "lib/friendly_id/sluggable_instance_methods.rb", "lib/friendly_id/tasks.rb", "lib/friendly_id/version.rb", "lib/tasks/friendly_id.rake", "lib/tasks/friendly_id.rb", "test/cached_slug_test.rb", "test/contest.rb", "test/custom_slug_normalizer_test.rb", "test/models/book.rb", "test/models/city.rb", "test/models/country.rb", "test/models/district.rb", "test/models/event.rb", "test/models/legacy_thing.rb", "test/models/novel.rb", "test/models/person.rb", "test/models/post.rb", "test/models/thing.rb", "test/models/user.rb", "test/non_slugged_test.rb", "test/schema.rb", "test/scoped_model_test.rb", "test/slug_test.rb", "test/slugged_model_test.rb", "test/sti_test.rb", "test/tasks_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://friendly-id.rubyforge.org/}
  s.post_install_message = %q{
***********************************************************

  If you are upgrading friendly_id, please run

      ./script/generate friendly_id --skip-migration

  in your Rails application to ensure that you have the
  latest friendly_id Rake tasks.

***********************************************************

}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{friendly-id}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A comprehensive slugging and pretty-URL plugin for ActiveRecord.}
  s.test_files = ["test/cached_slug_test.rb", "test/custom_slug_normalizer_test.rb", "test/non_slugged_test.rb", "test/scoped_model_test.rb", "test/slug_test.rb", "test/slugged_model_test.rb", "test/sti_test.rb", "test/tasks_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.2.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.2.3"])
      s.add_development_dependency(%q<newgem>, [">= 1.5.2"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 2.3.3"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.2.3"])
      s.add_dependency(%q<activesupport>, [">= 2.2.3"])
      s.add_dependency(%q<newgem>, [">= 1.5.2"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 2.3.3"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.2.3"])
    s.add_dependency(%q<activesupport>, [">= 2.2.3"])
    s.add_dependency(%q<newgem>, [">= 1.5.2"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 2.3.3"])
  end
end

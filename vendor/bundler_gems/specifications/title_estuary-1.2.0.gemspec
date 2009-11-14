# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{title_estuary}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Rosen"]
  s.date = %q{2009-09-06}
  s.description = %q{Title Estuary speeds up development by giving you good default titles and simple customizability, including internationalization.}
  s.email = %q{james.a.rosen@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["MIT-LICENSE", "README.rdoc", "Rakefile", "VERSION", "lib/title_estuary.rb", "lib/title_estuary/high_voltage_support.rb", "lib/title_estuary/inherited_resources_support.rb", "tasks/doc.task", "tasks/gem.task", "tasks/test.task", "test/default_titles_test.rb", "test/dynamic_page_title_test.rb", "test/high_voltage_integration_test.rb", "test/inherited_resources_integration_test.rb", "test/interpolated_page_titles_test.rb", "test/rails_integration_test.rb", "test/shoulda_macros/page_title_macros.rb", "test/simple_custom_titles_test.rb", "test/test_helper.rb", "test/vendor/high_voltage/app/controllers/high_voltage/pages_controller.rb", "test/vendor/high_voltage/config/high_voltage_routes.rb", "test/vendor/high_voltage/init.rb", "test/vendor/high_voltage/install.rb", "test/vendor/high_voltage/lib/high_voltage/extensions/routes.rb", "test/vendor/high_voltage/lib/high_voltage.rb", "test/vendor/high_voltage/test/pages_controller_test.rb", "test/vendor/high_voltage/test/test_helper.rb", "test/vendor/high_voltage/uninstall.rb", "test/village_model_and_controller.rb"]
  s.homepage = %q{http://github.com/gcnovus/title_estuary}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Title Estuary: RDoc", "--charset", "utf-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Easy, internationalized page titles}
  s.test_files = ["test/default_titles_test.rb", "test/dynamic_page_title_test.rb", "test/high_voltage_integration_test.rb", "test/inherited_resources_integration_test.rb", "test/interpolated_page_titles_test.rb", "test/rails_integration_test.rb", "test/shoulda_macros/page_title_macros.rb", "test/simple_custom_titles_test.rb", "test/test_helper.rb", "test/vendor/high_voltage/app/controllers/high_voltage/pages_controller.rb", "test/vendor/high_voltage/config/high_voltage_routes.rb", "test/vendor/high_voltage/init.rb", "test/vendor/high_voltage/install.rb", "test/vendor/high_voltage/lib/high_voltage/extensions/routes.rb", "test/vendor/high_voltage/lib/high_voltage.rb", "test/vendor/high_voltage/test/pages_controller_test.rb", "test/vendor/high_voltage/test/test_helper.rb", "test/vendor/high_voltage/uninstall.rb", "test/village_model_and_controller.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

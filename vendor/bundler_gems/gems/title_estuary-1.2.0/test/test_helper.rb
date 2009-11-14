test_dir = File.dirname(__FILE__)

# testing support:
  require 'test/unit'
  require 'test/unit/testcase'
  require 'rubygems'
  require 'shoulda'
  gem 'jferris-mocha'
  require 'mocha'
  require 'redgreen'

# set up Rails:
  ENV["RAILS_ENV"] ||= "test"
  RAILS_ROOT = "anywhere"
  require 'active_support'
  require 'action_controller'
  require 'action_controller/test_case'
  require 'action_controller/test_process'
  I18n.reload!
  ActionController::Base.view_paths = File.join(test_dir, 'views')
  class ApplicationController < ActionController::Base; end

# load title_estuary:  
  ActiveSupport::Dependencies.load_paths << File.expand_path(File.join(test_dir, '..', 'lib'))
  require_dependency 'title_estuary'
  Shoulda.autoload_macros File.join(test_dir, '..')
  
# load external libraries vendored for testing:  
  Dir.glob("#{test_dir}/vendor/*/app/*").each do |vendor_rails_app_dir|
    ActiveSupport::Dependencies.load_paths << vendor_rails_app_dir
    $LOAD_PATH << vendor_rails_app_dir
  end
  Dir.glob("#{test_dir}/vendor/*/lib").each do |vendor_lib_dir|
    ActiveSupport::Dependencies.load_paths << vendor_lib_dir
    $LOAD_PATH << vendor_lib_dir
  end

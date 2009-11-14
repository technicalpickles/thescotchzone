RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "friendly_id"
  config.gem 'inherited_resources'
  config.gem 'clearance'
  config.gem 'formtastic'
  config.gem 'title_estuary'
  config.gem 'searchlogic'
  config.gem 'will_paginate'
  config.time_zone = 'UTC'
end

DO_NOT_REPLY = "donotreply@thescotchzone.com"

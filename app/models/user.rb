class User < ActiveRecord::Base
  include Clearance::User
  validates_presence_of :screen_name
  attr_accessible :screen_name
end

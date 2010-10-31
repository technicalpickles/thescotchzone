class User < ActiveRecord::Base
  include Clearance::User
  validates_presence_of :screen_name
  attr_accessible :screen_name

  has_many :notes
  has_many :scotches, :through => :notes

  has_friendly_id :screen_name, :use_slug => true

  scope :ascend_by_screen_name, order('screen_name ASC')

  def to_s
    screen_name
  end
end

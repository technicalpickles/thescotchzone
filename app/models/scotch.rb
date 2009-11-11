class Scotch < ActiveRecord::Base
  validates_presence_of :name

  has_friendly_id :name, :use_slug => true

  has_many :notes
  has_many :users, :through => :notes

  def to_s
    name
  end
end

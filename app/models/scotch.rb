class Scotch < ActiveRecord::Base
  validates_presence_of :name

  has_many :notes
  has_many :users, :through => :notes

  has_friendly_id :name, :use_slug => true

  def to_s
    name
  end
end

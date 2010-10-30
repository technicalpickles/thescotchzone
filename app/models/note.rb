class Note < ActiveRecord::Base
  belongs_to :scotch
  belongs_to :user

  validates_presence_of :body, :scotch, :user

  scope :descend_by_created_at, order('created_at DESC')
end

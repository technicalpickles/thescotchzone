class Note < ActiveRecord::Base
  belongs_to :scotch
  belongs_to :user

  validates_presence_of :body, :scotch, :user
end

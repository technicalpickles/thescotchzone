require 'test_helper'

class ScotchTest < ActiveSupport::TestCase
  should_validate_presence_of :name

  should_have_many :notes
  should_have_many :users
end

require 'test_helper'


class UserTest < ActiveSupport::TestCase
  should_validate_presence_of :screen_name
  should_have_many :notes
  should_have_many :scotches
end

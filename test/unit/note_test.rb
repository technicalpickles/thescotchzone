require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should_belong_to :scotch
  should_belong_to :user
end

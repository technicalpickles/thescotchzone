require 'test_helper'

class ScotchesControllerTest < ActionController::TestCase

  context "index" do
    setup do
      @scotch = Scotch.create!

      get :index
    end

    should_respond_with :success
    should_render_template :index
    should_assign_to(:scotches) { [@scotch] }
  end

end

require 'test_helper'

class ScotchesControllerTest < ActionController::TestCase

  context "index" do
    setup do
      @scotch = Scotch.create! :name => "Dalmour"

      get :index
    end

    should_respond_with :success
    should_render_template :index
    should_assign_to(:scotches) { [@scotch] }
  
    should "have link to new scotch" do
      url = new_scotch_path
      assert_select "a[href=#{url}]" 
    end

    should "have a link to the scotch" do
      url = scotch_path(@scotch)
      assert_select "a[href=#{url}]", "Dalmour"
    end

  end

end

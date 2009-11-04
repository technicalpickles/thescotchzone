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

  context "new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :scotch, :class => Scotch

    should "render form to create" do
      url = scotches_path
      assert_select "form[action=#{url}][method=post]" do
        assert_select "input[type=text][name='scotch[name]']"
        assert_select "input[type=text][name='scotch[age]']"
        assert_select "input[type=submit]"
      end

    end
  end

  context "create" do
    setup do
      post :create, :scotch => { :name => 'Dalmour', :age => 12 }
      @scotch = Scotch.find_by_name('Dalmour')
    end

    should_redirect_to('the scotch index') { scotch_url(@scotch) }

    should "ensure a scotch was created" do
      assert @scotch
      assert_equal 'Dalmour', @scotch.name
      assert_equal 12, @scotch.age
    end
  end

  context "show" do
    setup do
      @scotch = Scotch.create! :name => 'Glennfiddich', :age => 18

      get :show, :id => @scotch.id
    end

    should_respond_with :success
    should_render_template :show
    should_assign_to(:scotch) { @scotch }

    should "display heading with name" do
      assert_select "h1", "Glennfiddich"
    end

  end


end

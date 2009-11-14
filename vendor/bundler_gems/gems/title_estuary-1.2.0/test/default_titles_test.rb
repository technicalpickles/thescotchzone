require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/village_model_and_controller'

class DefaultTitlesTest < ActionController::TestCase
  include PageTitleMacros
  tests VillagesController
  
  context 'a RESTful, titleize controller' do
                                   
    context 'with no custom page titles set up' do
      
      setup { clear_translations! }
    
      context 'on a GET to :index' do
        setup { get :index }
        should_set_the_page_title_to 'All Villages'
        should 'not generate the title twice' do
          @controller.page_title
          @controller.stubs :look_up_or_generate_page_title
          @controller.page_title
          assert_received @controller, :look_up_or_generate_page_title do |expect|
            expect.never
          end
        end
      end
    
      context 'on a GET to :new' do
        setup { get :new }
        should_set_the_page_title_to 'New Village'
      end
    
      context 'on a POST to :create that fails' do
        setup { post :create }
        should_set_the_page_title_to 'New Village'
      end
    
      context 'on a GET to :show for a resource that exists' do
        setup do
          Village.stubs(:find).returns(Village.new('Bostonburgh'))
          get :show, :id => 'anything'
        end
        should_set_the_page_title_to "Village Bostonburgh"
      end
    
      context 'on a GET to :show for a resource that does not exist (or is not set to an obvious instance variable)' do
        setup do
          Village.stubs(:find).returns(nil)
          get :show, :id => '2'
        end
        should_set_the_page_title_to "Village 2"
      end
    
      context 'on a GET to :edit for a resource that exists' do
        setup do
          Village.stubs(:find).returns(Village.new('Gloucestershire'))
          get :edit, :id => 'something'
        end
        should_set_the_page_title_to "Edit Village Gloucestershire"
      end
    
      context 'on a GET to :edit for a resource that does not exist (or is not set to an obvious instance variable)' do
        setup do
          Village.stubs(:find).returns(nil)
          get :edit, :id => '3'
        end
        should_set_the_page_title_to "Edit Village 3"
      end
    
      context 'on a PUT to :update for a resource that exists' do
        setup do
          Village.stubs(:find).returns(Village.new('East Umbridge'))
          put :update, :id => 'seven'
        end
        should_set_the_page_title_to "Edit Village East Umbridge"
      end
    
      context 'on a PUT to :update for a resource that does not exist (or is not set to an obvious instance variable)' do
        setup do
          Village.stubs(:find).returns(nil)
          put :update, :id => '100'
        end
        should_set_the_page_title_to "Edit Village 100"
      end
    
      context 'on a GET to a custom collection action' do
        setup { get :burninated }
        should_set_the_page_title_to "Burninated Villages"
      end
    
      context 'on a GET on a custom member action for a resource that exists' do
        setup do
          Village.stubs(:find).returns(Village.new('Parrotshire'))
          get :burninate, :id => '14'
        end
        should_set_the_page_title_to "Burninate Village Parrotshire"
      end
    
      context 'on a GET to a custom member action for a resource that does not exist (or is not set to an obvious instance variable)' do
        setup do
          Village.stubs(:find).returns(nil)
          get :burninate, :id => '9'
        end
        should_set_the_page_title_to "Burninate Village 9"
      end
    
    end
  
  end

end

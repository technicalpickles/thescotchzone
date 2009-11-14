require File.dirname(__FILE__) + '/test_helper'

class PagesController < HighVoltage::PagesController
  include TitleEstuary
  include TitleEstuary::HighVoltageSupport
end

ActionController::Routing::Routes.draw do |map|
  map.resources :pages, :only => [:show]
end

class HighVoltageIntegrationTest < ActionController::TestCase
  include PageTitleMacros
  tests PagesController
  
  context 'a RESTful controller using both Title Estuary and Inherited Resources' do
    
    context 'with custom page titles that involve interpolation' do
      
      setup do
        clear_translations!
      end
      
      context 'on a GET to :show for a page with no i18n title set' do
        setup do
          get :show, :id => 'info'
        end
        should 'set the page title to the requested page name, titleized' do
          assert_page_title_is 'Info'
        end
      end
      
      context 'on a GET to :show for a page with an i18n title set' do
        setup do
          define_translation 'page.title.pages.faq', "FAQ"
          get :show, :id => 'faq'
        end
        should 'use the requested page name as the action in the key' do
          assert_page_title_is 'FAQ'
        end
      end
      
    end
    
  end
  
end

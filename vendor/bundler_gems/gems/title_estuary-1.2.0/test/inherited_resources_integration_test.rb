require File.dirname(__FILE__) + '/test_helper'
require 'inherited_resources'
require 'inherited_resources/actions'
require 'inherited_resources/base_helpers'
require 'inherited_resources/class_methods'
require 'inherited_resources/url_helpers'
require 'inherited_resources/base'

class Pizza
  def initialize(name); @name = name.to_s; end
  def to_s; @name; end
  def to_param; '1'; end
  def method_missing(*args, &block); self; end
end

class DeliciousThingsController < InheritedResources::Base
  self.resource_class = Pizza
  include TitleEstuary
  include TitleEstuary::InheritedResourcesSupport
  def cheesey; index; end
  def add_topping; show; end
  def pizza_url(*args); delicious_thing_url(*args); end
end

ActionController::Routing::Routes.draw do |map|
  map.resources :delicious_things, :collection => { :cheesey     => :get },
                                   :member     => { :add_topping => :get }
end

class InheritedResourcesIntegrationTest < ActionController::TestCase
  include PageTitleMacros
  tests DeliciousThingsController
  
  context 'a RESTful controller using both Title Estuary and Inherited Resources' do
    
    context 'with custom page titles that involve interpolation' do
      
      setup do
        clear_translations!
      end
      
      context 'on a GET to :index' do
        setup do
          Pizza.stubs(:find).returns([])
          get :index
        end
        should_set_the_page_title_to 'All Pizzas'
      end
      
      context 'on a GET to :new' do
        setup { get :new }
        should_set_the_page_title_to 'New Pizza'
      end
    
      context 'on a POST to :create that fails' do
        setup { post :create }
        should_set_the_page_title_to 'New Pizza'
      end
    
      context 'on a GET to :show' do
        setup do
          Pizza.stubs(:find).returns(Pizza.new('Vegetarian Special'))
          get :show, :id => 'anything'
        end
        should_set_the_page_title_to "Pizza Vegetarian Special"
      end
    
      context 'on a GET to :edit' do
        setup do
          Pizza.stubs(:find).returns(Pizza.new('NY Thin Crust'))
          get :edit, :id => 'something'
        end
        should_set_the_page_title_to "Edit Pizza NY Thin Crust"
      end
    
      context 'on a PUT to :update' do
        setup do
          Pizza.stubs(:find).returns(Pizza.new('Neapolitan'))
          put :update, :id => 'seven'
        end
        should_set_the_page_title_to "Edit Pizza Neapolitan"
      end
    
      context 'on a GET to a custom collection action' do
        setup do
          Pizza.stubs(:find).returns([])
          get :cheesey
        end
        should_set_the_page_title_to "Cheesey Pizzas"
      end
    
      context 'on a GET on a custom member action for a resource that exists' do
        setup do
          Pizza.stubs(:find).returns(Pizza.new('Margherita'))
          get :add_topping, :id => '14'
        end
        should_set_the_page_title_to "Add Topping Pizza Margherita"
      end
      
    end
    
  end
  
end

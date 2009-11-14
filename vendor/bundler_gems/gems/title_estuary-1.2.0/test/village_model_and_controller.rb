class Village
  def initialize(name); @name = name; end
  def to_s; @name.to_s; end
end

class VillagesController < ActionController::Base
  include TitleEstuary
  def index; render :nothing => true; end
  def burninated; index; end
  def new; index; end
  def create; index; end
  def show; @village = Village.find; index; end
  def burninate; show; end
  def edit; show; end
  def update; show; end
  def destroy; show; end
end

ActionController::Routing::Routes.draw do |map|
  map.resources :villages, :collection => { :burninated => :get },
                           :member     => { :burninate  => :get }
end

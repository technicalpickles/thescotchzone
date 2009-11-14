ActionController::Routing::Routes.draw do |map|
  map.resources :notes
  map.resources :users

  map.resources :scotches, :has_many => :notes
  map.root :controller => :welcome, :action => :show
end

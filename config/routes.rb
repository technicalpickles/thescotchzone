ActionController::Routing::Routes.draw do |map|
  map.resources :notes

  map.resources :scotches
  map.root :controller => :welcome, :action => :show
end

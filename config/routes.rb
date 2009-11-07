ActionController::Routing::Routes.draw do |map|
  map.resources :notes

  map.resources :scotches, :has_many => :notes
  map.root :controller => :welcome, :action => :show
end

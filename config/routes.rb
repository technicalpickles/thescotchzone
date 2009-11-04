ActionController::Routing::Routes.draw do |map|
  map.resources :scotches

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

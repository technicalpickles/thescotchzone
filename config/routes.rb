Thescotchzone::Application.routes.draw do
  resources :notes
  resources :users

  resources :scotches do
    resource :notes
  end

  root :to => "welcome#show"
end

Thescotchzone::Application.routes.draw do
  resources :notes
  resources :users

  resources :scotches do
    resource :notes
  end

  # wtf, why this not picked up automatically?
  match 'sign_out' => 'clearance/sessions#destroy', :via => [:delete, :get], :as => 'sign_out'

  resource :welcome, :controller => 'welcome'
  root :to => "welcome#show"
end

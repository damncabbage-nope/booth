Booth::Application.routes.draw do
  resources :events, :only => [:index, :show]
  resources :orders, :only => [:index]

  root :to => 'events#index'
end

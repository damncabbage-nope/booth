Booth::Application.routes.draw do
  resources :events, :only => [:index, :show]
  root :to => 'events#index'
end

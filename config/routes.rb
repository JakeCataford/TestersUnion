TestersUnion::Application.routes.draw do
  

  resources :leads

  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/generate-tokens', to: 'dashboard#generate_new_tokens' 
  
  resources :users
  match '/login', :to => 'sessions#new', :as => :login, via: [:get, :post]
  match '/auth/g/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end

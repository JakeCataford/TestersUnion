TestersUnion::Application.routes.draw do
  

  root to: "signup#index"
  resources :leads

  post '/signup/create', to: 'signup#create'

  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/generate-tokens', to: 'dashboard#generate_new_tokens' 
  
  get '/signup/destroy', to: 'signup#destroy'

  get '/t', to: 'signup#respond'

  resources :users
  match '/login', :to => 'sessions#new', :as => :login, via: [:get, :post]
  match '/auth/g/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end

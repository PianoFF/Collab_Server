Rails.application.routes.draw do
  # resources :messages
  # resources :instrumentals
  # resources :vocals
  # resources :posts
  # resources :locations
  # resources :users

#user_routes
  post '/signup', to: 'users#signup'
  post '/login', to: 'users#login'
  post '/validate', to: 'users#validate'
  get '/users', to: 'users#index' 
  get '/users/:id', to: 'users#show'
  patch '/users/:id', to: 'users#update'

#post_routes
  post '/posts', to: 'posts#create'
  get '/posts', to: 'posts#index'
  delete '/posts/:id/', to: 'posts#destroy' 
  
#message_routes
  post '/messages', to: 'messages#create'

#vocal_routes
  post '/vocals', to: 'vocals#create'

#instrumental_routes
  post '/instrumentals', to: 'instrumentals#create'

#
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

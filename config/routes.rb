Rails.application.routes.draw do
  # resources :messages
  # resources :instrumentals
  # resources :vocals
  # resources :posts
  # resources :locations
  # resources :users

#user_routes
  post '/users', to: 'users#create'
  post '/login', to: 'users#login'

#post_routes
  post '/posts', to: 'posts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

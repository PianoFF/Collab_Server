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

#post_routes
  post '/posts', to: 'posts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

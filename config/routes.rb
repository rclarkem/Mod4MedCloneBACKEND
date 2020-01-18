Rails.application.routes.draw do
  resources :articles
  resources :stories 
  resources :comments
  resources :followings, only: [:create, :destroy]
  resources :users
  post '/login', to: 'login#create'
  post '/users/:id/stories/', to: 'stories#create'
  # get '/users/stories/:id', to: 'stories#show'
  # get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

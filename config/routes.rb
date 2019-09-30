Rails.application.routes.draw do
  resources :follows
  resources :reviews
  resources :reservations
  resources :users
  resources :restaurants
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

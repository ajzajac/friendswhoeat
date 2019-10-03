Rails.application.routes.draw do
  
  resources :follows
  resources :reviews
  resources :reservations
  resources :users
  resources :restaurants
  resources :sessions
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/', to: 'users#welcome'
  get '/feed', to: 'users#feed', as: :feed
  resources :conversations do
    resources :messages
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

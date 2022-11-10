Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users

  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index]
  end



  resources :artworks, only: [:show, :update, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]



end

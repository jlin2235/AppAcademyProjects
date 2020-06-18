Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :create, :update, :destroy] do 
    resources :artworkshares, only: [:index, :create, :update, :destroy]
  end

  resources :users, only: [:index, :show, :create, :update, :destroy] do 
    resources :artworks, only: [:index]
  end
  
  resources :users, only: [:index, :show, :create, :update, :destroy] do 
    resources :comments, only: [:index, :create, :destroy]
  end

  resources :artworks, only: [:show, :create, :update, :destroy] do 
    resources :comments, only: [:index, :create, :destroy]
  end

  # get '/users', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'


  







end

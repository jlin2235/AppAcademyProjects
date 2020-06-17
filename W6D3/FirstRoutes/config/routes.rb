Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users

  get '/users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  # get '/laughs', to: 'laughs#index'   # manually creates single route
  # get '/laughs/:id', to: 'laughs#show' # `:id` is a wildcard - dynamic segment of the path, this will be replaces with an actual id
  # post '/laughs', to: 'laughs#create'
  # patch '/laughs/:id', to: 'laughs#update'
  # put '/laughs/:id', to: 'laughs#update'
  # delete '/laughs/:id', to: 'laughs#destroy'

  







end

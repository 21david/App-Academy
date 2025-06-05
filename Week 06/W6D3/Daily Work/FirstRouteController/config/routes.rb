Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/users', to: 'users#index', as: 'user'
  get '/users/:id', to: 'users#show', as: 'show_user'
  post '/users', to: 'users#create', as: 'create_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  put '/users/:id', to: 'users#update', as: 'update_user_put'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'
  
  resources :users do 
    # lets us see the specified user's artworks
    # (and artworks shared with that user)
    resources :artworks, only: [:index]
  end

  resources :users do 
    # lets us see the specified user's comments
    resources :comments, only: [:index]
  end

  resources :artworks do 
    # lets us see the comments left on the
    # specified artwork
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  resources :artwork_shares, only: [:index, :show, :create, :update, :destroy]
  resources :comments, only: [:index,:create,:destroy]

  resources :likes, only: [:index, :show, :create]
end

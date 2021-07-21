Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get '/users', to: 'users#index', as: 'user'
  get '/users/:id', to: 'users#show', as: 'show_user'
  post '/users', to: 'users#create', as: 'create_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  put '/users/:id', to: 'users#update', as: 'update_user_put'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'
end

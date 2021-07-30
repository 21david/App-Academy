Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :create] do
    resources :subs, except: [:destroy]
  end
  resource :session, only: [:create, :new, :destroy]
  # resources :subs, except: [:destroy]

end

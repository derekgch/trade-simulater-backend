Rails.application.routes.draw do

  resources :users, only: [:show, :create, :update]

  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
      get '/stock/:id', to: 'stock#search'
      get '/batch/:id', to: 'stock#batch'
      get '/price/:id', to: 'stock#price'
  end

  post '/trades/:id', to: 'users#trades'

end

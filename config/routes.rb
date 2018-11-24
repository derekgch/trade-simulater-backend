Rails.application.routes.draw do

  resources :users, only: [:show, :create, :update]

  resources :sessions, only: [:create]


  namespace :api do
      get '/stock/:id', to: 'stock#search'
      get '/batch/:id', to: 'stock#batch'
      get '/price/:id', to: 'stock#price'
  end

  # testing pagination
  # get '/page/:id', to: 'users#page'

  get '/trades/:id', to: 'users#history'
  post '/trades/:id', to: 'users#trades'

end

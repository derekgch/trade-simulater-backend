# README
# TTP-FS-20180728-backend
## This is a Ruby-on-rails backend for TTP-FS-20180728
### For frontend please check
https://github.com/derekgch/ttp-fs-20180728-frontend

### Routes:
#### API routes: Gateway from transfer data from IEX to these routes
####  get 'api/stock/:id'
####  get 'api/batch/:id'
####  get 'api/price/:id'

####    Standard Restful routes for users
####    resources :users, only: [:show, :create]

####    Login Session route
####    resources :sessions, only: [:create]

####    Custom routes for trade history and execute Buy/Sell trades
####    get '/trades/:id'
####    post '/trades/:id'

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


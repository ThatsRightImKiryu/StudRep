Rails.application.routes.draw do
  get 'index/input'
  get 'index/output'
  get 'session/login'
  get 'session/create'
  get 'session/logout'
  get 'index/output', as: 'output'
  post 'session/login'
  post 'session/create'
  post 'session/logout'

  root 'index#input'
  resources :users
  get "/users/#{@user}", as: 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  get 'index/input'
  get 'index/output'
  get 'index/output', as: 'output'
  post 'session/login'
  get 'session/logout'
  get 'session/login'
  post 'session/create'

  root 'index#input'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

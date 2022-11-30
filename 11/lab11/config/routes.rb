Rails.application.routes.draw do
  get 'index/input', as: 'input'
  root 'index#input'
  get 'index/output', as: 'output'
  get "/index/show_db", as: 'show_db'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

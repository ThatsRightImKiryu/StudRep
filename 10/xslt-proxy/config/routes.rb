Rails.application.routes.draw do
  root 'proxy#input'
  get 'proxy/input'
  get 'proxy/output'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

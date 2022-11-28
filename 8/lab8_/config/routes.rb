# frozen_string_literal: true

Rails.application.routes.draw do
  root 'enter#input'
  get 'enter/input', as: 'input'
  get 'enter/compute', as: 'compute'
  post '/enter/input'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

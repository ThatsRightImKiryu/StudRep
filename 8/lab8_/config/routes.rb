# frozen_string_literal: true

Rails.application.routes.draw do
  root 'enter#input'
  get 'enter/input'
  get 'enter/compute'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

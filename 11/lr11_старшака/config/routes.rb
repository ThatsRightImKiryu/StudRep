Rails.application.routes.draw do
  get 'calc/index'
  get 'calc/view'
  root 'calc#index'
end

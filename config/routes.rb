Rails.application.routes.draw do

  resources :users
  resources :images

  root 'images#index'

end

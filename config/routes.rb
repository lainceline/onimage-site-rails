Rails.application.routes.draw do

  use_doorkeeper

  resources :users
  resources :images

  root 'images#index'

end

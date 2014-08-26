Rails.application.routes.draw do

  resources :users
  resources :images

  root 'application#index'
  get '*path' => 'application#index'

end

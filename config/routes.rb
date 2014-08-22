Rails.application.routes.draw do

  get 'static_page/index'

  resources :users
  resources :images

  root 'static_page#index'

end

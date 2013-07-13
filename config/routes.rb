GhettoBlaster::Application.routes.draw do

  resources :gittos

  authenticated :user do
    root to: 'home#index'
  end
  root to: "welcome#index"
  get "meter", to: "meter#index"

  devise_for :users
  resources :users
end

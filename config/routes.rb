GhettoBlaster::Application.routes.draw do

  resources :gittos

  authenticated :user do
    root to: 'home#index'
  end
  root to: "welcome#index"
  get "meter", to: "meter#index"

  get "welcome", to: "welcome#index2"

  devise_for :users
  resources :users
end

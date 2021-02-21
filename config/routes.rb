Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create]
  #resources :user do
  #  resources :items, only: :create
  #end
end

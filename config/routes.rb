Rails.application.routes.draw do
  resources :questions, only: [:index]
  root to: "questions#index"
  devise_for :users
  resources :users, only: [:show, :update, :edit]
  resources :follows, only: [:index, :create, :destroy]
end

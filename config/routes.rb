Rails.application.routes.draw do
  get "follows/create"
  get "follows/destroy"
  resources :questions, only: [:index]
  root to: "questions#index"
  devise_for :users
  resources :users, only: [:show, :update, :edit]
  resources :follows
end

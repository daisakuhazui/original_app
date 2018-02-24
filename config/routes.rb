 Rails.application.routes.draw do
  root to: "questions#new"
  resources :questions, only: [:new, :index, :create, :destroy]
  devise_for :users
  resources :users, only: [:index, :show, :update, :edit] do
    member do
      get "show_following"
      get "show_followers"
    end
  end
  resources :follows, only: [:index, :create, :destroy]
  resources :answers, only: [:new, :create, :destroy]
end

Rails.application.routes.draw do
  resources :questions, only: [:index, :create, :destroy]
  root to: "questions#index"
  devise_for :users
  resources :users, only: [:show, :update, :edit] do
    member do
      get "show_following"
      get "show_followers"
    end
  end
  resources :follows, only: [:index, :create, :destroy]
  resources :answers, only: [:new, :create, :show]
end

Rails.application.routes.draw do
  resources :questions, only: [:index]
  root to: 'question#index'
  devise_for :users
end

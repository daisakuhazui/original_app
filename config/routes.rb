Rails.application.routes.draw do
  resources :questions
  root to: 'question#index'
  devise_for :users
end

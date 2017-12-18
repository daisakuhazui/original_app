Rails.application.routes.draw do
  root to: 'question#index'
  get 'question/new'
  get 'question/index'
  devise_for :users
end

Rails.application.routes.draw do
  get 'user_fields/index'
  get 'user_fields/create'
  get 'user_fields/new'
  root to: 'welcome#index'

  resources :users
  resources :user_fields
end

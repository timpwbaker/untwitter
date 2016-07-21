Rails.application.routes.draw do
  resources :messages, only: [:index, :create, :destroy]
  resources :users, only: [:show]
  root to: 'messages#index'
end

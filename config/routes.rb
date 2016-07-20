Rails.application.routes.draw do
  resources :messages
  resources :users, only: [:show]
  root to: 'messages#index'
end

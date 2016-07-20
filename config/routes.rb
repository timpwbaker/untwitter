Rails.application.routes.draw do
  resources :messages
  resources :users
  root to: 'messages#index'
end

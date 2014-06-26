Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  get '/login', to: 'welcome#new'

  resources :sessions, only: [:create, :destroy]
end

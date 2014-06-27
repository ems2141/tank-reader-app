Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'welcome#new'

  resource :sessions, only: [:create, :destroy]

  resources :users
  resources :stations
end

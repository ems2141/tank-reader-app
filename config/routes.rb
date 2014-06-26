Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  get '/login', to: 'welcome#new'

  resource :sessions, only: [:create, :destroy]
end

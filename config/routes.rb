Rails.application.routes.draw do

  root 'users#index'

  resources :users, except: [:show, :index]

  resources :events

  resources :comments, only: :create

  resources :sessions, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

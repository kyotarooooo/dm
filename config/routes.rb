Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#top"
  get "users/search" => "users#search"
  resources :users, only: [:index, :show]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :decks, only: [:new, :create, :index, :show] do
  	resources :likes, only: [:create, :destroy]
  end
end

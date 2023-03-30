Rails.application.routes.draw do
  root to: 'homes#top', 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes, only: [:about]
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit]
end

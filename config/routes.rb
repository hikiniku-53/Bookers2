Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/home/about' => 'homes#about', as: 'about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update, :create,]
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  patch 'users/:id' => 'users#update', as: 'update_user'
  delete 'users/:id' => 'users#destroy', as: 'destroy_user'
end

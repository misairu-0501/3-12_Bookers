Rails.application.routes.draw do

  root to: 'homes#top' #ルートディレクトリの設定
  # get 'homes/top'　#不要

  get 'books' => 'books#index', as: 'index'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

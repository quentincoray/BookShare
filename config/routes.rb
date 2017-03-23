Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookmates, only: [:show] do
    resources :selling_books, only: [:show, :new, :create]
  end
  resources :orders, only: [:show, :new, :create, :update]
  resources :books, only: [:show]
  resources :selling_books, only: [:edit, :update]

  get 'search', to: 'bookmates#search'

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]

  post 'orders/:id/delivered', to: 'orders#delivered'
end



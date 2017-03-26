Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookmates, only: [:show] do
    resources :selling_books, only: [:show, :new, :create] do
    end
  end
  resources :orders, only: [:show, :new, :create, :update]

  post 'orders/:id/delivered', to: 'orders#delivered'
  post 'orders/:id/reviewed', to: 'orders#reviewed'
  post 'bookmates/:id/loved_bookstores', to: 'bookmates#bookmarked'

  resources :books, only: [:show]
  resources :selling_books, only: [:edit, :update]

  get 'search', to: 'bookmates#search'

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update] do
    resources :loved_books, only: [:create]
  end
  # post 'books/:id/create', to: 'loved_books#create'
  # post 'bookmates/:id/loved_bookstores', to: 'loved_bookstores#bookmate_liked'
end



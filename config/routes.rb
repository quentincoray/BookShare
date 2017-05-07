Rails.application.routes.draw do

  # FB log in, controller part added
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :bookmates, only: [:show] do
    resources :selling_books, only: [:show, :new, :create]
    resource :loved_bookstore, only: [:create, :destroy]
  end
  resources :orders, only: [:show, :new, :create, :update]

  #post 'orders/:id/delivered', to: 'orders#delivered'
  post 'orders/:id/reviewed', to: 'orders#reviewed'
  #post 'bookmates/:id/loved_bookstores', to: 'bookmates#bookmarked'
  # post 'selling_books/:id/liked', to: 'selling_books#liked'

  resources :books, only: [:show] do
    resource :loved_book, only: [:create, :destroy]
  end

  resources :selling_books, only: [:edit, :update]

  get 'search', to: 'bookmates#search'

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update] do
    resources :conversations, only: [:index, :create] do
      resources :messages, only: :create
    end
  end

  post 'orders/:id/delivered', to: 'orders#delivered'


  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  # post 'books/:id/create', to: 'loved_books#create'
  # post 'bookmates/:id/loved_bookstores', to: 'loved_bookstores#bookmate_liked'
end



Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookmates, only: [:show] do
    resources :selling_books, only: [:show]
  end

  resources :books, only: [:show]

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]
end


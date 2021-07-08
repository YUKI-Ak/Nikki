Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :profiles
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end

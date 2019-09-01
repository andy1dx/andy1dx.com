Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :home, only: [:index]
  resources :categories, only: [:show]
  resources :articles, only: [:index, :show]
  resource :about, only: [:show]
  resource :contact, only: [:show]
  post 'search', to: 'search#show'
  namespace :admins do
    root to: "dashboard#index"
    resources :dashboard
    resources :categories
    resources :banners
    resources :articles
  end
end

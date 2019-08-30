Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :home
  
  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions',
  #   passwords: 'admins/passwords',
  # }
  namespace :admins do
    root to: "dashboard#index"
    resources :dashboard
    resources :categories
  end
end

Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  root "products#index"
  resources :products do
    collection do
      get "filter"
      get "search"
    end
  end

  resources :varieties do
    resources :products
  end

  resource :provinces do
    resources :users
  end

  resources :users do
    resources :payments
  end
  # resources :variety do
  #   resources :products
  # end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  post 'cart/:id/update_quantity' => 'cart#update_quantity', as: 'update_quantity'
  resources :cart, only: %i[create destroy edit]
  devise_for :users do
    resources :payments
    resources :orders
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'
  resources :products do
    collection do
      get 'filter'
      get 'search'
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
    resources :orders
  end

  resources :orders do
    resources :province_tax
  end

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  # resources :cart, only: [:create, :destroy, :edit]
  # resources :variety do
  #   resources :products
  # end
end

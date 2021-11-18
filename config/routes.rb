Rails.application.routes.draw do
  root "products#index"
  resources :products

  resources :varieties do
    resources :products
  end

  # resources :variety do
  #   resources :products
  # end
end

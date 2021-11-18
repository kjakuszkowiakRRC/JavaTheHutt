Rails.application.routes.draw do
  root "varieties#index"

  resources :varieties do
    resources :products
  end

  # resources :variety do
  #   resources :products
  # end
end

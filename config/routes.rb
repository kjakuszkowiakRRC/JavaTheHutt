Rails.application.routes.draw do
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


  # resources :variety do
  #   resources :products
  # end
end

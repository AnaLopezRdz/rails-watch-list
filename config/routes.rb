Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :lists do
    resources :bookmarks, only: [:index, :new, :create]
  end

  root 'lists#index'
end

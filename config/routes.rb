Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'artists/index'

  root to: "artists#index"

  resources :artists, only: [:index, :show, :destroy] do
    resources :songs, only: [:create, :destroy]
  end

  namespace :api do
    resources :artists, only: [:index, :show, :destroy] do
      resources :songs, only: [:create, :destroy]
    end
  end
end

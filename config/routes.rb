Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root to: "home#index"

  resources :categories do
    resources :images, only: [:create, :show]
  end

  resources :images, only: [:index]
end

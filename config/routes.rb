Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "home#index"

  resources :categories do
    resources :images, only: [:create, :show] do
      resource :like, only: [:create]
      resource :comment, only: [:create]
    end
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "home#index"

  resources :categories do
    get :my_categories, on: :collection
    resources :subscribers, only: [:create, :destroy]
    resources :images, only: [:create, :show] do
      resource :like, only: [:create, :destroy]
      resource :comment, only: [:create]
    end
  end
end

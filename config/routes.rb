Rails.application.routes.draw do
  
  devise_for :companies, controllers: {
    registrations: 'companies/registrations'
  }
  devise_for :students, controllers: {
    registrations: 'students/registrations'
  }
  root to: "pages#home"

  resources :offers, only: %i[index show]


  namespace :company do # permet de faire sous catégories de user
    resources :offers, only: %i[new create show]
    resource :profile, only: :show
    resource :dashboard, only: :show
    resources :applications, only: [] do
      member do
        get :accept
        get :decline
      end
    end
  end

  namespace :student do # permet de faire sous catégories de user resource :profile, only: :show
    resource :profile, only: :show
    resource :dashboard, only: :show
    resources :offers, only: [:show] do
      resources :applications, only: %i[new create]
      resources :savedoffers, only: %i[create update]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

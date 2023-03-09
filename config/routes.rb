Rails.application.routes.draw do



  root to: "pages#home"
  get 'pages/download_pdf'

  devise_for :companies, controllers: {
    registrations: 'companies/registrations', sessions: 'companies/sessions'
  }


  devise_for :students, controllers: {
    registrations: 'students/registrations'
  }



  resources :students do
    member do
      patch 'student/profiles',         action: :profiles,  as: :profiles
    end
  end

  resources :offers, only: %i[index show]
  resources :searches, only: %i[create show]
  resource :confidentpage, only: :show
  resource :termsyconditions, only: :show

  patch 'offers/:id', controller: 'company/offers', action: :update
  delete "offers/:id", controller: 'company/offers', action: :destroy

  namespace :company do # permet de faire sous catégories de user
    resources :offers do
      member do
        get :accept
        get :decline
      end
    end
    resource :profile, only: :show
    resource :dashboard, only: :show
    resources :applications, only: %i[index show] do
      resources :comments, only: [:create]
      member do
        get :accept
        get :decline
        get :keep
        get :nokeep
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

  namespace :student do
    resource :tags do
      member do
        put :create_multiple
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

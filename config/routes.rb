Rails.application.routes.draw do
  devise_for :companies
  devise_for :students
  root to: "pages#home"

  resources :offers, only: %i[index show] do
    resources :applications, only: %i[new create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

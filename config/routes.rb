Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :doctors, only: [] do
    resources :appointments, only: [:create]
  end

  resources :appointments, only: [:edit, :update]

  root "home#index"
end

Rails.application.routes.draw do

    #require "admin_constraint"
    require 'sidekiq/web'

    #constraints lambda {|request| AuthConstraint.admin?(request) } do
    mount Sidekiq::Web => '/admin/sidekiq'
  
  devise_for :users, controllers: {
      passwords: 'users/passwords'
  }

  resources :users do
    collection do
      post 'add', to: 'users#create', as: 'add'
    end

    resources :parcels
  end

  resources :parcels do
    collection do
      get 'tracking_code/:code', to: 'parcels#show', as: 'tracking_code'
    end
  end

  # This section generates the URLs for the API endpoints of this app
  # Through this endpoints URLs we expose the data that we want to share to other apps
  namespace :api do
    resources :track_events
    resources :users
  end

  get 'home/index' => 'home#index', as: 'dashboard'
  get 'postcode' => 'postcode#postcode'
  match 'lookup_postcode' => 'postcode#lookup_postcode', via: [:get, :post]
  get 'welcome/faq'
  get 'welcome/about'
  get 'welcome/features'
  get 'welcome/index'
  

  root to: 'welcome#index'
  
end

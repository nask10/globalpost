Rails.application.routes.draw do

    #require "admin_constraint"
    require 'sidekiq/web'

    #constraints lambda {|request| AuthConstraint.admin?(request) } do
    mount Sidekiq::Web => '/admin/sidekiq'
  
  devise_for :users

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

  namespace :api do
    resources :track_events
    resources :users
  end

  get 'home/index' => 'home#index', as: 'dashboard'
  get 'postcode/postcode', 'postcode#postcode'
  post 'postcode/lookup_postcode', 'postcode#lookup_postcode'
  get 'welcome/faq'
  get 'welcome/about'
  get 'welcome/features'
  get 'welcome/index'
  

  root to: 'welcome#index'
  
end

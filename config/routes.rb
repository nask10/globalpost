Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
  end

  get 'welcome/faq'
  get 'welcome/about'
  get 'welcome/features'
  get 'welcome/index'
  

  root to: 'home#index'
  
end

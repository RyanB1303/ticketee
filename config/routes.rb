Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    
    resources :projects, except: [:index, :show]
    resources :users
  end
  devise_for :users
  resources :projects, only: [:index, :show] do
    resources :tickets
  end

  root "projects#index"
end

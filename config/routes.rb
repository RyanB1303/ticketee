Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
  end
  devise_for :users
  resources :projects do
    resources :tickets
  end

  root "projects#index"
end

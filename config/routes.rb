Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tickets
  end

  root "projects#index"
end

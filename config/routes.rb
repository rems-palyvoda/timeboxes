Rails.application.routes.draw do
  devise_for :users
  resources :projects, only: [:index, :create, :update, :destroy]
  root "projects#index"
end

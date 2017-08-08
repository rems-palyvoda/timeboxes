Rails.application.routes.draw do
  resources :projects, only: [:index, :create, :update, :destroy]
  root "projects#index"
end

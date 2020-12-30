Rails.application.routes.draw do
  devise_for :users
  root  "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy, :index] do
    resources :orders, only: [:index, :new, :create]
  end
end

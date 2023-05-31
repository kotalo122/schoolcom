Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :events, only: [:index, :create, :edit, :update, :destroy, :show] do
      resources :comments, only: :create
      resources :likes, only: [:create, :destroy]
     end
  end
end

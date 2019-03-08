Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors, only: [:index, :show] do
    #resources :slots, only: [:index, :show, :edit, :update]
    #resources :reviews, only: [:index, :show]
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:create, :new]
  end


  resources :users, only: [:show]
  resources :bookings, only: [:index, :show, :edit, :update]
end



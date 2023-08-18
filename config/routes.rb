Rails.application.routes.draw do
  root "pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users
  resources :resume
  get "/@:account/profile/admin", to: "profiles#index", as: :user_admin
  get "/@:account/profile/", to: "profiles#show", as: :user_profile
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  # get '/auth/google/callback', to: 'sessions#create'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users
  get '/:account/profile/admin', to: 'profiles#index', as: :user_admin
  get '/:account/profile/', to: 'profiles#show', as: :user_profile
  
end

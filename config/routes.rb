Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  # get '/auth/google/callback', to: 'sessions#create'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :resumes

  scope path: '@:account' do
    resource :resumes, except: [:index, :create] do
      member do
        post :second, as: :second_page
      end
    end
  end
  
  # post '/resumes/1/second', to: 'resumes#second', as: :second_page
end

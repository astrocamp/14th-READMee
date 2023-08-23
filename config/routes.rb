Rails.application.routes.draw do
  root 'pages#index'
  
  resources :blogs
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :resumes
  scope path: '@:account' do
    resource :profile, except: [:destroy]
    resource :company do
      resources :jobs
    end
    resources :resumes, only: [:edit, :update]
  end
  get "toggle_role", to: "users#toggle", as: :toggle_role 
end

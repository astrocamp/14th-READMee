Rails.application.routes.draw do
  root 'pages#index'
  
  resources :blogs
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope path: '@:account' do
    resource :profile, except: [:destroy]
    resource :resumes, only: [:edit, :update]
  end 
end

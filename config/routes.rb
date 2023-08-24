Rails.application.routes.draw do
  root 'pages#index'
  
  resources :blogs

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :resumes, only:[:new]
 
  scope path: '@:account' do
    namespace :admin do
      resources :users
    end
    resource :profile, except: [:destroy]
    resources :resumes, only: [:edit, :update]
    resource :company do
      resources :jobs
    end
  end

end 

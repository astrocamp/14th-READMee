Rails.application.routes.draw do
  root 'pages#index'
  
  resources :blogs
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :resumes
  
  scope path: '@:account' do
    resource :profile, except: [:destroy]
  end 

  scope '@:account' do
    resource :company do
      resources :jobs
    end
  end
end

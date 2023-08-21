Rails.application.routes.draw do
  root 'pages#index'
  
  resources :blogs
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :resumes
 
  scope path: '@:account' do
    resource :profile, except: [:destroy]
    resources :resumes, only: [:edit, :update]
    resource :company do
      resources :jobs
    end
  end

  get "/jobs_list", to: "jobs#jobs_list"
end 

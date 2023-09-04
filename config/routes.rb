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
  post "toggle_role", to: "users#toggle", as: :toggle_role 
  get "select_role", to: "users#select_role", as: :select_role
  post "employer", to: "users#employer", as: :employer
  post "job_seeker", to: "users#job_seeker", as: :job_seeker
  get "pricing", to: "prices#show", as: :pricing
  get "chat_messages", to: "chat_messages#index"
  post "chat_messages", to: "chat_messages#reply"
end

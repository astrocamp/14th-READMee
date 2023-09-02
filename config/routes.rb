Rails.application.routes.draw do
  root 'pages#index'
  
  resources :articles

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :resumes, only:[:new, :index, :show]
 
  scope path: '@:account' do
    namespace :admin do
      resources :users
    end
    get "dashboard", to:"users#dashboard"
    resource :profile, except: [:destroy]
    resources :resumes, only: [:edit]
    resources :portfolios, except: [:show, :new]
    resource :company do
      resources :jobs
    end
  end

  get "select_role", to: "users#select_role", as: :select_role
  get "pricing", to: "prices#show", as: :pricing
  get "/jobs_list", to: "jobs#jobs_list"
  patch "/@:account/resumes/:id", to: "resumes#update", as: :update_resume
  post "toggle_role", to: "users#toggle", as: :toggle_role 
  post "employer", to: "users#employer", as: :employer
  post "job_seeker", to: "users#job_seeker", as: :job_seeker
end

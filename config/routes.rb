Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :resumes, only:[:new, :index, :show]
  resources :articles
  resources :job_matchings, only: [:edit, :update]

  scope path: '@:account' do
    namespace :admin do
      resources :users
    end
    resource :profile, except: [:destroy]
    resources :resumes, only: [:edit, :update]
    resources :portfolios, except: [:show, :new]
    resource :company, except: [:show] do
      resources :jobs, except: [:show]
    end
  end

  get "company/jobs/:id", to: "jobs#show", as: "job_show"
  get "company/:id", to: "companies#show", as: "company_show"
  get "/@:account/apply_job", to: "users#apply_job", as: "apply_job"
  get "/@:account/notification", to: "users#notify", as: "notify"
  get "select_role", to: "users#select_role", as: :select_role
  get "pricing", to: "prices#show", as: :pricing
  get "jobs_list", to: "jobs#jobs_list"
  get "receive_apply/:id", to: "jobs#receive_application", as: :receive_apply
  post "/@:account/company", to: "companys#create", as: "create_company"
  post "job_seeker_list", to: "users#job_application" 
  post "toggle_role", to: "users#toggle", as: :toggle_role
  post "employer", to: "users#employer", as: :employer
  post "job_seeker", to: "users#job_seeker", as: :job_seeker
  patch "/@:account/resumes/:id", to: "resumes#update", as: :update_resume 
end

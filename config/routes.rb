Rails.application.routes.draw do 
  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :resumes

  resource :company, except: [:index, :delete]
  resources :jobs
end

Rails.application.routes.draw do 
  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :resumes

  scope '@:account' do
    resource :company do
      resources :jobs
    end
  end
end

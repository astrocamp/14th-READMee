Rails.application.routes.draw do
  root "pages#index"  
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope ':account' do
    resources :profiles
  end

  scope ':account' do
    resource :company do
      resources :jobs
    end
  end
  
  resources :resumes
  resources :blogs

  post '/path_to_switch_role', to: 'users#switch_role', as: :switch_role
end

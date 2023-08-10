Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # scope path: '@:account' do
    resource :profile, except: [:destroy]
  # end
end

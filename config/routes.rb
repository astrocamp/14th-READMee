<<<<<<< HEAD
Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :profiles, except: [:destroy]  
  resources :resumes
end
=======
Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # scope path: '@:account' do
    resource :profile, except: [:destroy]
  # end
end
>>>>>>> 8a51783 ([build]: the profile CRUD and add the css of all views)

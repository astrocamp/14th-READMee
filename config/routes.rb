Rails.application.routes.draw do
  # scope path: '@:account' do
    resource :profile, except: [:destroy]
  # end
end

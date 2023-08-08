Rails.application.routes.draw do
  resources :profiles, except: [:destroy] 
end

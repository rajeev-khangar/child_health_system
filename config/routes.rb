Rails.application.routes.draw do
  
  root 'welcomes#new'
  resources :managers
  resources :hospitals do
    resources :users do
    	resources :babies
    end
    resources :healths
  end
  resource :admin, only: [:new]
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

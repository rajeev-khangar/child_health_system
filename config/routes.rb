Rails.application.routes.draw do
  
  root 'welcomes#new'
  resources :managers
  resources :hospitals do
    resources :users do
      resources :babies do
        resources :healths
      end
    end
  end

  resources :babies do 
    resources :healths do
      collection do
        get :weight
        get :height
      end
    end
  end
  resources :fathers
  resources :mothers
  resources :healths
  resource :admin, only: [:new]
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

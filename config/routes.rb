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
    resources :vitamin_as, only: [:new, :create]
    resources :baby_infant_feedings
    resources :baby_cares
  end
  resources :baby_vitamins, only: [:new, :create]
  resources :baby_vaccinations 
  resources :fathers
  resources :risk_factors
  resources :vaccinations
  resources :infant_feeding_labels 
  resources :care_labels 
  resources :mothers
  resource :admin, only: [:new]
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

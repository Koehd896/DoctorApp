Rails.application.routes.draw do
    
    root 'static#home'
    
    resources :doctors, :patients
    resources :patients, only: [:show] do
        resources :appointments, only: [:new, :create]
    end
    post '/sessions/destroy', to: 'sessions#destroy'
    post '/sessions/create', to: 'sessions#create'
    get '/patientlogin', to: 'patients#login'
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 

end

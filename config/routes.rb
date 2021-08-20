Rails.application.routes.draw do
    
    root 'static#home'
    resources :appointments
    resources :prescriptions

    resources :doctors, :patients
    resources :patients, :doctors do
        resources :appointments, :prescriptions
    end
    post '/sessions/destroy', to: 'sessions#destroy'
    post '/sessions/create', to: 'sessions#create'
    get '/patientlogin', to: 'patients#login'
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 
    get '/sessions/patient_login', to: 'sessions#patient_login'
    get 'sessions/doctor_login', to: 'sessions#doctor_login'

end

Rails.application.routes.draw do
    resources :doctors, :patients
    post '/sessions/destroy', to: 'sessions#destroy'
    post '/sessions/create', to: 'sessions#create'
    get '/patientlogin', to: 'patients#login'
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 

end

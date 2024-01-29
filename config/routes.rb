Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "users#index"
  
  get '/users/get_all_users', to: 'users#get_all_users'

  get 'users/generate_pdf'

  resources :users

  post '/countries/country_departments', to: 'countries#country_departments'
  post '/departments/departments_cities', to: 'departments#departments_cities'


end

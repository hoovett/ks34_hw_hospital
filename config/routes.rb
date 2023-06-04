Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'pages/home'
  root 'pages#home'
  resources :patients
  resources :cards
  resources :doctors
  resources :specialities
  resources :departments
  resources :hospitals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'export_data', to: 'data_export#export', format: 'pdf'
  get 'download_hospital_info_pdf', to: 'data_export#download_hospital_info_pdf', format: 'pdf'
  get 'download_patient_info_pdf', to: 'data_export#download_patient_info_pdf', format: 'pdf'
  get 'export_data', to: 'data_export#export', format: 'csv'


devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
end

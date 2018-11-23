Rails.application.routes.draw do
  get 'braintree/new'
  get 'braintree/new_six'
  get 'braintree/new_one'
  get 'welcome/index'
  root 'welcome#index'

  get '/index' => "audio#index"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, controller:'users'
  resources :companies, controller:'company'
  
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :companies do 
    resource :request, controller: 'request'
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post 'braintree/checkout'
  post 'braintree/checkout_six'
  post 'braintree/checkout_one'
  get 'companies/:company_id/users/:id/confirm' => 'users#confirm', as:'confirm_user' 
  get 'companies/:id/employees_index' => 'company#employees_index', as:'employees_index'

  patch 'users/:id/remove_employee' => 'company#remove_employee', as:'remove_employee'

end

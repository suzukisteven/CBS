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

  resources :users, controller:'users', only: [:show]
  resources :companies, controller:'company', only: [:create, :new, :edit, :show, :update]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post 'braintree/checkout'
  post 'braintree/checkout_six'
  post 'braintree/checkout_one'

end

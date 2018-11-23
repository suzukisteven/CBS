Rails.application.routes.draw do

  # Home / Root
  root 'welcome#index'
  get 'welcome/index'

  # Individual pages Routes
  get '/index' => "audio#index"
  get "/show" => "dashboard#show", as: "dashboard"
  get 'users/:id/video' => "video#show", as: "user_video"
    # Text Analysis
  get 'users/:id/texts'=>'text#show', as: "text_analyze"
  post 'users/:id/texts'=>'text#create', as:"text_upload"

  # Braintree Payment Routes
  get 'braintree/new'
  get 'braintree/new_six'
  get 'braintree/new_one'
  post 'braintree/checkout'
  post 'braintree/checkout_six'
  post 'braintree/checkout_one'

  # Clearance Routes
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/show'=>"video#show"  ,as: "video_feature"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, controller:'users'
  resources :companies, controller:'company'

  # Google Oauth Callback Route
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post 'braintree/checkout'
  post 'braintree/checkout_six'
  post 'braintree/checkout_one'
  get 'companies/:company_id/users/:id/confirm' => 'users#confirm', as:'confirm_user' 
  get 'companies/:id/employees_index' => 'company#employees_index', as:'employees_index'

  patch 'users/:id/remove_employee' => 'company#remove_employee', as:'remove_employee'

end

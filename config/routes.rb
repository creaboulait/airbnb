Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :listings, controller: "listings" do
    resources :reservations, controller: "reservations", except: [:show]
  end

  # resources :reservations, only: [:show] do
  #   resources :payments, controller: "payments", only: [:new, :checkout]
  # end
  
  resources :users, controller: "users", only: [:create, :edit, :update, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end



  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ################################################################

  root 'welcome#index'

  # redirects the user from Google to our app
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  #Routes for Listing
  patch 'listings/:id/verify' => 'listings#verify', as: "verify"
  post 'listings/search' => 'listings#search', as: "search"

  #Routes for Payments
  get 'reservations/:id/payments/new' => 'payments#new', as: "new_payment"
  post 'reservations/:id/payments/checkout' => 'payments#checkout', as: "checkout_payment"

  
end

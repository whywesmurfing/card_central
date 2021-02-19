Rails.application.routes.draw do
  devise_for :users
  resources :listings

  root "listings#index"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'sessions/new'

  root "pages#home"
  get 'pages/home'
  get '/signup', to: "vendors#new"
  post '/signup', to: "vendors#create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :categories do
    resources :products
  end

  resources :vendors do
    member do
      get :confirm_email
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

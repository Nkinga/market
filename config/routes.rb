Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home'
  get '/signup', to: "vendors#new"
  post '/signup', to: "vendors#create"

  resources :categories do
    resources :products
  end

  resources :vendors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

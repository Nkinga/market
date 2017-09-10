Rails.application.routes.draw do
  root "pages#home"
  get 'pages/home'

  resources :categories do
    resources :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

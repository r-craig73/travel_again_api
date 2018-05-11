Rails.application.routes.draw do
  resources :reviews

  root :to => 'reviews#index'

  post 'authenticate', to: 'authentication#authenticate'

end

Business::Application.routes.draw do
  root :to => 'orders#index'
  match 'model_example', to: 'pages#model'

  resources :orders
end

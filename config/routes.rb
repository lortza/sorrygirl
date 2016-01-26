Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :apologies
  resource :session

  root 'apologies#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  
end #routes

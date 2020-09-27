Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'carts/show'
  root 'products#index'

  # get 'carts/:id' => "carts#show", as: "cart"
  # delete 'carts/:id' => "carts#destroy"

  # post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  # post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  # post 'line_items' => "line_items#create"
  # get 'line_items/:id' => "line_items#show", as: "line_item"
  # delete 'line_items/:id' => "line_items#destroy"
  # resources :orders

  #root :to => 'products#index'
  resources :products
  
  namespace :api, defaults: { format: :json } do
  	namespace :v1 do
  		resources :products, only: [:index]
  	end
  end
  post 'auth/register', to: 'users#register'
  post 'authenticate', to: 'authentication#authenticate'
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

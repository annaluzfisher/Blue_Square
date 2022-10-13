Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :items, only: [ :show ] 
    resources :carts, only: [ :create,:show ]
    resources :reviews, only: [ :create, :destroy, :update]
    resources :cart_items, only: [:create, :update, :destroy ]
    resources :users, only: [ :create ] 
    resources :collections, only: [ :index ] 
   resource :session, only: [ :show, :create, :destroy ]
   get 'search/:query', to: 'search#search'
     get 'search5/:query', to: 'search#search5'
     delete 'carts/:userId' to 'cart#clear'
   get '*path', to: 'static_pages#frontend_index'
  end
end



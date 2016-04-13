Rails.application.routes.draw do
  root 'menus#index'
  devise_for :users, module: "users"
  devise_scope :user do
    get 'signout', to: 'users/sessions#destroy'
  end

  resources :menus  do
    member do
      get 'dishes'
      post 'compose'
    end
  end
  resources :users
  resources :carts do
    member do
      post 'confirm'
    end
  end
  resources :categories
  resources :dishes
  get '/order' => 'order#index'
  post '/order/add_to_cart' => 'carts#add_dish'
  post '/order/delete_from_cart' => 'carts#delete_dish'

  scope '/api', :defaults => {:format => :json} do
    scope '/v1' do
      devise_scope :user do
        post 'sign_in', to: 'users/sessions#create'
        delete 'sign_out', to: 'users/sessions#destroy'
      end
      get 'menus', to: 'menus#index'
      get 'menus/:id', to: 'menus#show'
      get 'categories', to: 'categories#index'
      get 'dishes', to: 'dishes#index'
      get 'dishes/:id', to: 'dishes#show'
      get 'carts/:id', to: 'carts#show'
      post 'carts/:id/confirm', to: 'carts#confirm'
      post 'carts', to: 'carts#create'
      delete 'carts/:id', to: 'carts#destroy'
      post 'dish/:id/add_to_cart', to: 'carts#add_dish'
      post 'dish/:id/delete_from_cart', to: 'carts#delete_dish'
    end
  end

end

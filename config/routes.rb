Rails.application.routes.draw do
  root 'menus#index'
  #get 'static_pages/example1'
  #match '*all', to: 'application#cors_preflight_check', via: :options
  devise_for :users, module: "users"

  resources :menus  do
    member do
      get 'dishes'
      post 'compose'
      #get 'order'
    end
  end
  #resources :users
  resources :carts
  resources :categories
  resources :dishes
  get '/order' => 'order#index'
  post '/order/add_to_cart' => 'carts#add_dish'
  post '/order/delete_from_cart' => 'carts#delete_dish'
  #get 'dishes/compose'

  namespace :api, :defaults => {:format => :json} do
    get 'menus', to: 'menus#index'
    get 'menu/:id/dishes', to: 'menus#dishes'
    get 'categories', to: 'categories#index'
    get 'dishes', to: 'dishes#index'
    get 'cart', to: 'carts#cart'
    delete 'carts/:id', to: 'carts#destroy'
    post 'dish/:id/add_to_cart', to: 'carts#add_dish'
    post 'dish/:id/delete_from_cart', to: 'carts#delete_dish'
  end

#  devise_scope :user do
#    get 'signin' => 'users/sessions#new'
#    match 'signout', to: 'users/sessions#destroy', via: :get
#  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

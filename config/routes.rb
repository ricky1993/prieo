Rails.application.routes.draw do

  namespace :designer do
    get 'home/index'
    resource :product
    get 'products/index'
  end





  namespace :admin do
    get 'home/index'
    get 'home/login'
    get 'home/about'
    get 'home/help'
    get 'home/contact_us'
    root 'home#login'

    get 'products/delete'

    resources :orders
    resources :products



    get 'resources/configure'
    get 'resources/global_header'
    get 'resources/global_body'
    get 'resources/global_footer'
    get 'resources/new_global'
    get 'resources/product'
    get 'resources/check'
    get 'resources/product_picture'


    get 'resources/new_product'

    resources :resources

    get 'users/show'
    get 'users/delete'
    get 'users/edit'
    get 'users/new'
    get 'users/index'

  end


  resources :orders
  resources :line_items
  resources :carts
  resources :products
  get 'store/checkout'
  get 'store/empty_cart'
  get 'store/display_cart'
  get 'store/add_to_cart'
  get 'store/index'
  get 'home/about'

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'store#index'

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

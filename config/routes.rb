Depot::Application.routes.draw do

  get "pointsofsale/index"
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"
  get "showcase/Home"
  #get "showcase/Map"
  get "showcase/Video"
  get "showcase/Idea"
  get "showcase/Legend"
  get "showcase/Workwithus"
  get "showcase/Presse"
  get "maps/index"
  get "store/index"
  get "pointsofsale/index"
  get 'pointsofsale' => 'pointsofsale#index'
  get 'idea' => 'showcase#Idea'
  get 'legend' => 'showcase#Legend'
  get 'workwithus' => 'showcase#Workwithus'
  get 'presse' => 'showcase#Presse'
  get 'store' => 'store#index'
  get 'maps' => 'maps#index'
  get 'video' => 'showcase#Video'
  get 'summary' => 'orders#summary'
  get 'contact' => 'contacts#new'
  get 'paypal/checkout', to:'orders#paypal_checkout'
  get "instagram" => redirect("https://www.instagram.com/lebenefique/")
  get "facebook" => redirect("https://www.facebook.com/infusionslebenefique/?fref=ts")
  resources :users

scope '(:locale)' do
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  resources :maps
  resources :users, only: [:update]


    match '/contacts',     to: 'contacts#new',             via: 'get'
    resources "contacts", only: [:new, :create]
    resources :users, only: [:update]

    root 'showcase#Home', as: 'showcase'
end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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

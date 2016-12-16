Depot::Application.routes.draw do
  get "pointsofsale/index"
  get 'admin' => 'admin#index'
  get "showcase/Home"
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
  devise_for :users
scope '(:locale)' do
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  resources :maps
  get '/users' => 'sessions#index', as: 'users'
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  root 'showcase#Home', as: 'showcase'
end
end

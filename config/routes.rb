Rails.application.routes.draw do

  namespace :admin do
    resources :artists, except: :new do
      post :remove_visits, on: :member
      resources :tabs
    end
    resources :tabs
    resources :users
    resources :pages

    root 'admin#root'
  end

  namespace :me do
    get   :settings, to: 'me#settings'
    patch :update  , to: 'me#update'

    resources :tabs, only: [:new, :show, :create, :update, :destroy]

    root 'me#root'
  end

  namespace :api do
    resources :artists, only: [:index, :show] do
      resources :tabs, only: :show
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  scope module: :public do

    resources :artists, path: '/artistas', only: [:show, :index] do
      resources :tabs, path: '', only: :show
    end

    resources :pages, path: '/paginas', only: [:show, :index]

    resources :users, path: '/usuarios', only: :show

    get 'canciones/:id' , to: 'tabs#old_url'
    get 'tablaturas/:id', to: 'tabs#old_url'

    post 'vote/:id/:value' => 'tabs#vote', as: :vote, constraints: {value: /2|4|6|8|10/}
    post 'favorite/:id' => 'tabs#favorite', as: :favorite

    get :search, to: 'search#search', as: :search
    #get :options, to: 'search#options', as: :options
    #get :more_options, to: 'search#more_options'

    get  :login , to: 'login#log_in' , as: :login
    post :logout, to: 'login#log_out', as: :logout
    post :submit_login, to: 'login#submit', as: :submit_login

    get  :register,        to: 'register#register', as: :register
    post :submit_register, to: 'register#submit',   as: :submit_register

    get 'activate/:token', to: 'user_activation#activate', as: :activate

    get  :forgot_password       , to: 'reset_password#forgot_password'  , as: :forgot_password
    post :send_instructions     , to: 'reset_password#send_instructions', as: :send_instructions
    get  'reset_password/:token', to: 'reset_password#reset_password'   , as: :reset_password
    patch :submit_reset_password, to: 'reset_password#submit'           , as: :submit_reset_password

    get 'auth/:provider/callback', to: 'login#create'
    get 'auth/failure', to: redirect('/')

    get :sitemaps, to: 'public#sitemap', format: 'xml'

    # You can have the root of your site routed with "root"
    root 'public#home'
  end

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

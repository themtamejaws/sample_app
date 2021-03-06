SampleApp::Application.routes.draw do
  get "labs/new"
  resources :users do
    member do
      get :following, :followers
      get :to_protocol_id, :for_user_id
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :relevant_protocols, only: [:create, :destroy]
  resources :orders, only: [:create, :destroy]
  resources :protocols, only: [:create, :destroy]                                                                                                                          

  root 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/papers',  to: 'static_pages#papers',  via: 'get'
  match '/protocols/public', to: 'static_pages#protocols_view', via: 'get'
  match '/protocols/public/:id', to: 'static_pages#protocols_show', via: 'get'
  match '/orders',  to: 'orders#view',          via: 'get'
  match '/protocols',  to: 'protocols#view',       via: 'get'
  match '/protocols/:id',  to: 'protocols#show',       via: 'get'
  match '/relevant_protocols/:id',  to: 'protocols#view',       via: 'post'
  match '/relevant_protocols',  to: 'static_pages#home',       via: 'delete'

  get 'schedule/:equipment' => 'schedule#view', as: :equipment_schedule
  post 'schedule/:equipment/book' => 'schedule#create'
  post 'schedule/:equipment/unbook' => 'schedule#destroy'

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

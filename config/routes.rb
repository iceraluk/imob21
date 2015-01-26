require 'sidekiq/web'

Imob21::Application.routes.draw do

  devise_for :admins
  resources :admins
  authenticate :admin do
    mount Sidekiq::Web, at: '/sidekiq'
  end
  resources :offers
  resources :clients
  resources :owners
  resources :messages
  root :to => 'b2c#index'
  match "oferta/:id" => 'b2c#oferta', :as => "b2c_offer", via: :get
  match "listare_oferte" => 'b2c#listare_oferte', :as => "b2c_offer_listing", via: :get
  match "contact" => 'b2c#contact', :as => "b2c_contact", via: :get
  match "despre_noi" => 'b2c#despre_noi', :as => "b2c_despre_noi", via: :get
  match "informatii_utile" => 'b2c#informatii_utile', :as => "b2c_informatii_utile", via: :get
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

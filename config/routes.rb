Rails.application.routes.draw do

  
  resources :file_uploads

#root :to => redirect('/file_uploads')
  root :to => "owners#show"
  #root1 :to => "owners#index"

  # root :to => "home#index"
  get "menu" => "create_owner#access_right"
  resources :owners
    get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "home" => "create_owner#housing_society", :as => "home"
  get "loginadmin" => "owners#new", :as => "loginadmin"
  resources :owners
  resources :sessions

resources :messages
    post 'messages/create'
    get "/show" => "messages#show"
  post "/create" => "messages#create"
    get "/delete" => "messages#destroy"
get "message/sms" => "messages#show"
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
get ':controller(/:action(/:id(.:format)))'
post ':controller(/:action(/:id(.:format)))'
end

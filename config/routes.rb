Rails.application.routes.draw do

  get 'users/index' => 'users#index'
  get 'users' => 'users#create_show'
  post 'users/login' => 'users#login'
  get 'users/login' => 'users#login_show'
  post 'users' => 'users#create'
  resource :users


  post 'information/provinces' => 'information#provinces'
  post 'information/majors' => 'information#majors'
  post 'information/cities' => 'information#cities'
  post 'information/grades' => 'information#grades'
  post 'information/hospitals' => 'information#hospitals'

  post 'information/create_hospital' => 'information#create_hospital'
  post 'information/create_department' => 'information#create_department'
  post 'information/create_doctor' => 'information#create_doctor'
  get 'information/auto_home' => 'information#auto_home'
  get 'information/edit' => 'information#edit'
  resource :information
  post 'hospital' => 'hospitals#show'
  post 'hospitals/edit' => 'hospitals#edit'
  resource :hospital

  resource :order
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

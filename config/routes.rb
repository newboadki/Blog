MyBlog::Application.routes.draw do

scope '(:locale)' do
  
  # blog posts
  get "blog_posts" => "blog_posts#index", :as => "blog_posts"   
  get "blog_posts/:id" => "blog_posts#show", :as => "blog_post"
  

  # apps
  get "apps" => "apps#index", :as => "apps"   
  get "apps/:id" => "apps#show", :as => "app"   

  # static content
  # get 'curriculum' => "static_content#curriculum" 
  get 'home' => "static_content#home"
  
  # Root
  root to: 'static_content#home'
end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
   

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

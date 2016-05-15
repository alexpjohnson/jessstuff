Rails.application.routes.draw do
  
  
  resources :tag_type_groups
  resources :organizations
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  root 'specs#index'
  
  scope "/admin" do
    resources :users
  end
  
  resources :comments do
    put 'resolve'
  end
  
  resources :requests do
    collection do
      get 'poll'
    end
  end
  resources :tickets
  resources :projects
  resources :tag_types
  resources :tags
  resources :spec_types
  resources :specs do
    get 'delete'
    post 'bookmark'
    post 'move'
    collection do
      get 'mass_add_view'
      post 'mass_add'
      get 'filter_tag'
      get 'bookmarks'
    end
  end
  
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

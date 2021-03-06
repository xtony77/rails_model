Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  
  get 'about/:group' => 'about#index', as: 'about'
  get 'news/:group' => 'news#index', as: 'news'
  get 'news/:group/:id' => 'news#show', as: 'news_show'
  get 'album/:group' => 'album#index', as: 'album'
  get 'album/:group/:id' => 'album#show', as: 'album_show'

  namespace :admin do
    root      'index#index'
    resources :news, path: 'news/:group', except: [:show]
    resources :about, path: 'about/:group', except: [:show]
    resources :albums, path: 'albums/:group' do
      get 'photos/new'      => 'albums#photo_new'
      post 'photos'         => 'albums#photo_create'
      post 'photos/destory' => 'albums#photo_destroy'
    end
    resources :admins, except: [:show, :edit, :update]
  end

  root 'index#index'

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

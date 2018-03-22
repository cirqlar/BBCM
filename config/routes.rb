require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root 'pages#index'
  post 'send' => 'pages#create'
  get 'about' => 'pages#about'

  get 'gallery' => 'images#index'
  resources :images, except: [:index]

  resources :messages, except: [:show]
  get 'message' => 'messages#show', as: :show_message

  resources :audio, except: [:show]
  get 'audio' => 'audio#show', as: :show_audio

  resources :slides, except: [:show]
  resources :announcements, :path => 'ans'
  resources :subscribers, only: [:create]
  get 'subs/:id' => 'subscribers#destroy', as: :subs_destroy

  get 'hashmin/login' => 'sessions#new', as: :login
  post 'hashmin/login' => 'sessions#create'
  get 'hashmin/logout' => 'sessions#destroy', as: :logout
  get 'hashmin/:id' => 'admins#index', as: :admin
  resources :admins, except: [:show], path: 'hashmin'

  resources :password_resets, only: [:new, :create, :edit, :update]

  mount Sidekiq::Web => '/sidekiq'

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

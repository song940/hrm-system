Hrm::Application.routes.draw do


  namespace :admin do
    resources :dictionaries
  end

  get "home/index"
  get "search" => "search#index"
  get "salary" => "salary#index"




  resources :attachments

  resources :experiences

  resources :trains

  resources :performances

  resources :jobs

  resources :groups

  resources :educations

  resources :employees

  resources :checks

  resources :helps

  resources :notifictions

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    root :to => "home#index"
    
    resources :users
    resources :dictionaries
  end

  #get '/admin/log' => 'logs#index'

  match '/sign_up',                 to: 'users#new',         via: 'get'
  match '/sign_in',                 to: 'sessions#new',      via: 'get'
  match '/sign_out',                to: 'sessions#destroy',  via: 'delete'

  get "/:username"          => "users#show" ,     as: :user
  get "/:username/setting"  => "users#edit" , as: :user_profile
  get "/:username/destroy"  => "users#destroy"

  match '/user/register',     to: 'users#create' ,  via: 'post'
  match '/:username/update',  to: 'users#update' ,  via: 'patch'
  match '/:username/destroy', to: 'users#destroy' ,  via: 'delete' , as: :delete_user



  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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

Hrm::Application.routes.draw do
  namespace :admin do
    
  end

  get "home/index"
  get "search" => "search#index"
  get "salary" => "salary#index"


  post 'checks/import' => "checks#import"

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

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    root :to => "home#index"
  
    resources :users
    resources :settings

    get '/checks' => "checks#index"
    get '/checks/mark'
    get '/checks/list'
    post "/checks/setting"
  end

  #get '/admin/log' => 'logs#index'

  match '/sign_up',           to: 'users#new',         via: 'get'
  match '/sign_in',           to: 'sessions#new',      via: 'get'
  match '/sign_out',          to: 'sessions#destroy',  via: 'delete'
  match '/user/register',     to: 'users#create' ,     via: 'post'
  match '/user/verify/:email',to: 'users#verify' ,     via: 'get', as: :user_verify
  match '/user/active'       ,to: 'users#active' ,     via: 'get', as: :user_active

  
  match "/:username",         to: "users#show" ,       via: 'get',    as: :user_home
  match "/:username/msg",     to: "users#msg" ,        via: 'get',    as: :user_msg
  match "/:username/setting", to: "users#edit" ,       via: 'get',    as: :user_setting
  match '/:username/update',  to: 'users#update' ,     via: 'patch',  as: :user_update
  match "/:username/destroy", to: "users#destroy",     via: 'delete', as: :user_delete
  match "/:username/reset",   to: "users#reset",       via: 'post', as: :user_reset




  
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

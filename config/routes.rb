Rails.application.routes.draw do
 
  # Maybe this will be done with devise in future( they may have better security)
  match 'password_reset_request', to: 'users#password_reset_request', via: 'patch' #rename this with request
  match 'forgot_password', to: 'users#forgot_password', via: 'get'
  match 'reset_password', to: 'users#reset_password', via: 'get' # this get is fine, it's the link provided in emails
  match 'reset_password_submit', to: 'users#reset_password_submit', via: 'patch'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    match '/signup', to: 'devise/registrations#new', via: 'get'
    match '/signin', to: 'devise/sessions#new', via: 'get'
    match '/signout', to: 'devise/sessions#destroy', via: 'delete'
    root to: 'organizations#index'
  end

  match '/add_reminder', to: 'users#add_reminder', via: 'patch'



  match '/pipeline', to: 'pages#pipeline', via: 'get'
  match '/calendar', to: 'pages#calendar', via: 'get'
  match '/help', to: 'pages#help', via: 'get'


  match 'organizations/signup', to: 'organizations#new', via: 'get'

  #match '/events', to: 'pages#events', via: 'get'

  resources :users do
    member do
      get :attending, :joining
    end
  end

  #resources :sessions, only: [:new, :create, :destroy]

  resources :eu_rels, only: [:create, :destroy]
  resources :ou_rels, only: [:create, :destroy]
  resources :oe_rels, only: [:create, :destroy]

  resources :events  do
    member do
      get :attenders, :attending
    end
  end
  
  resources :organizations  do
    member do
      get :joiners, :attenders
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




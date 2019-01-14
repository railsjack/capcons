TestApp::Application.routes.draw do

  resources :answers_files, only: [:new, :create, :index, :show] do
    member do
      get 'view_answers_file'
      patch 'upload_image'
    end
  end

  resources :incidents_files, only: [:new, :create, :index, :show] do
    member do
      get 'view_incidents_file'
      patch 'upload_image'
    end
  end

  resources :jobhazards_files, only: [:new, :create, :index, :show] do
    member do
      get 'view_jobhazards_files'
      patch 'upload_image'
    end
  end

  resources :admins
  
  get "stats/index"
  post "stats/get_data" => 'stats#get_data'
  post "/users" => "users#create"
  get "/users/sign_out" => "sessions#destroy"

  devise_for :users, :controllers => {:registrations => 'registrations', sessions: "sessions" }
  
  devise_scope :user do
    # get "/some/route" => "some_devise_controller"
    match "/users/sign_in.:format" => "sessions#create", via: :options
    get "/users/sign_in.:format" => "sessions#create"
    match "/users/sign_out.:format" => "sessions#destroy", via: :options
    get "/users/sign_out.:format" => "sessions#destroy"
  end

  # "users/sign_in", to: "sessions#create"
  # match 'users/sign_in', :controller => 'sessions', :action => 'create', :constraints => {:method => 'OPTIONS'}
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
    root 'home#index'
    resources :invitations
    resources :users do
      member do
        get 'projects'
        patch 'allow_access'
      end
      collection do
        get 'add_user'
        post 'adduser'
      end
    end


    
    resources :questions, only: [:index] do
      member do
        get 'get_question'
      end
      resources :reports, only: [] do 
        member do
          get 'get_answer'
          get 'getanswerid'
        end
      end
    end

    resources :categories, only: [:index] do 
      member do
        get 'questions'
        get 'question'
        get 'no_questions'
      end
    end

    resources :projects do
      member do 
        get 'detail_report'
        get 'assign_project'
        get 'report'
        get 'users'
        get 'unassign'
        get 'submit_report'
        patch 'update_answer'
        get 'categories'
        get 'checklist'
      end
      collection do 
        post 'add_users'
      end
      resources :answers, only: [:index,:update] do
        member do
           patch 'update_answer'
           patch 'upload_image'
           get 'check_answer'  
        end
      end
      resources :reports do 
        member do
          get 'detail_report'
        end
      end
      resources :incidents, only: [:new, :create, :index, :show] do
        collection do
          get 'empty_incident'

        end
        member do
           get 'view_incident'
          patch 'upload_image'
        end
      end
      resources :jobhazards, only: [:new, :create, :index, :show] do
        collection do
          get 'empty_jobhazard'

        end
        member do
           get 'view_jobhazard'
          patch 'upload_image'
        end
      end
    end

    resources :reports, only: [] do
      member do
        get 'answers'
      end 
      resources :categories, only: [] do
        member do
          get 'answers'
        end
      end
    end

    resources :incidents, only: [] do
      member do 
        get 'send_new_incident'
        post 'send_email'
        get 'send_email'
        post 'send_email_by_incident'
        get 'send_email_by_incident'
      end
    end
    
    resources :jobhazards, only: [] do
      member do 
        get 'send_new_jobhazard'
        post 'send_email'
        get 'send_email'
        post 'send_email_by_jobhazard'
        get 'send_email_by_jobhazard'
      end
    end

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

MarshallklickmanCom::Application.routes.draw do

  
  get "journal/calendar" => "journal_entries#calendar", :as => "journal_entries_calendar"
  match "journal/goto_date" => "journal_entries#goto_date", :via => [:get, :post]
  match "journal/:month/:day" => "journal_entries#index",
    :constraints => { :month => /\d{1,2}/, :day => /\d{1,2}/ },
    :as => :journal_entries_date
  resources :journal_entries, :path => "/journal"



# cancel_admin_registration GET    /admins/cancel(.:format)        devise/registrations#cancel
#        admin_registration POST   /admins(.:format)               devise/registrations#create
#    new_admin_registration GET    /admins/sign_up(.:format)       devise/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)          devise/registrations#edit
#                           PUT    /admins(.:format)               devise/registrations#update
#                           DELETE /admins(.:format)               devise/registrations#destroy

  devise_for :admins, :skip => [:registrations]
  
  as :admin do
    get "admins/cancel(.:format)" => 'devise/registrations#cancel', :as => :cancel_admin_registration
    post "admins(.:format)" => 'devise/registrations#create', :as => :admin_registration
    get "make-new-admin" => 'devise/registrations#new', :as => :new_admin_registration
    get "admins/edit" => 'devise/registrations#edit', :as => :edit_admin_registration
    put "admins(.:format)" => 'devise/registrations#update'
    delete "admins(.:format)" => 'devise/registrations#destroy'
  end

  devise_scope :admin do
    match "prettify" => "devise/sessions#create", :as => :new_admin_session
    match "admin/sign-out" => "devise/sessions#destroy", :as => :destroy_admin_session
  end


  get 'posts/tagged/:tag', :to => 'posts#index', :as => :tagged_posts
  resources :posts
  resources :projects

  match "/about" => "site#about", :as => :about_page
  match "/work" => "projects#index", :as => :projects

  root :to => "site#about"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

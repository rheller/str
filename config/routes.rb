ActionController::Routing::Routes.draw do |map|



  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.root :controller => 'pages',
             :action     => 'show',
             :id       => 'love-first'



  map.forgot    '/forgot',                    :controller => 'users',     :action => 'forgot'
  map.reset     'reset/:reset_code',          :controller => 'users',     :action => 'reset'

  map.resources :users
  map.resource :session






#thing_path
 map.thing '/things/show/:id', :controller => "things",
                                                    :action     => "show"
                                                    
#page_path
 map.thing '/pages/show/:id', :controller => "pages",
                                                    :action     => "show"
                                                    
                                                    
#new_thing_path
map.new_thing '/things/new',         :controller => "things",
                                                    :action     => "new"

#import_thing_path
map.import_thing '/things/import',   :controller => "things",
                                                    :action     => "import"

#export_thing_path
map.export_thing '/things/export',   :controller => "things",
                                                    :action     => "export"

#report_thing_path
map.report_thing '/things/report',   :controller => "things",
                                                    :action     => "report"


map.connect '/green',              :controller => 'pages',
             :action     => 'show',
             :id       => 'love-mindfulness-and-the-environment'



  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
map.connect ':controller/:action/:id'
#rick comment out  map.connect ':controller/:action/:id.:format'
end

ActionController::Routing::Routes.draw do |map|
  map.public_home '/', :controller => 'home', :action => 'index'
  map.home '/home', :controller => 'home', :action => "home"
  map.get_started '/get_started', :controller => 'users', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.resources :users
  map.resources :sessions, :collection => {:unauthorized => :get}, :path_names => { :new => 'login' }
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

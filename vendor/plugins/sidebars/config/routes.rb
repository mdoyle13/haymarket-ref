ActionController::Routing::Routes.draw do |map|
  map.resources :sidebars

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :sidebars, :collection => {:update_positions => :post}
  end
end

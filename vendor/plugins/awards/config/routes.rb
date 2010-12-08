ActionController::Routing::Routes.draw do |map|
  map.resources :awards

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :awards, :collection => {:update_positions => :post}
  end
end

ActionController::Routing::Routes.draw do |map|
  map.resources :liquors

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :liquors, :collection => {:update_positions => :post}
  end
end

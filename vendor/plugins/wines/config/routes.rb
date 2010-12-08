ActionController::Routing::Routes.draw do |map|
  map.resources :wines

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :wines, :collection => {:update_positions => :post}
  end
end

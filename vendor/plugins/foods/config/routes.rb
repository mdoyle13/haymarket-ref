ActionController::Routing::Routes.draw do |map|
  map.resources :foods

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :foods, :collection => {:update_positions => :post}
  end
end

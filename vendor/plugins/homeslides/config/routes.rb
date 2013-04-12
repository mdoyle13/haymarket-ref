ActionController::Routing::Routes.draw do |map|
  map.resources :homeslides

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :homeslides, :collection => {:update_positions => :post}
  end
end

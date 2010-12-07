ActionController::Routing::Routes.draw do |map|
  map.resources :beers

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :beers, :collection => {:update_positions => :post}
  end
end

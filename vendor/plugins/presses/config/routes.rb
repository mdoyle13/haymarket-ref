ActionController::Routing::Routes.draw do |map|
  map.resources :presses

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :presses, :collection => {:update_positions => :post}
  end
end

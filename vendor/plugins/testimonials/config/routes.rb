ActionController::Routing::Routes.draw do |map|
  map.resources :testimonials

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :testimonials, :collection => {:update_positions => :post}
  end
end

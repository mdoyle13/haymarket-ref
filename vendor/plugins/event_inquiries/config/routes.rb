ActionController::Routing::Routes.draw do |map|
  map.new_inquiry '/event_inquiry', :controller => 'event_inquiries', :action => 'new'
  map.resources :event_inquiries

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :event_inquiries, :collection => {:update_positions => :post}
  end
end

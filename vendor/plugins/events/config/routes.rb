ActionController::Routing::Routes.draw do |map|
  map.resources :events
  map.beer_events 'beer_events', :controller => 'events', :action => 'beer_events'
  map.theatre_events 'theatre_events', :controller => 'events', :action => 'theatre_events'

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :events, :collection => {:update_positions => :post}
  end
end

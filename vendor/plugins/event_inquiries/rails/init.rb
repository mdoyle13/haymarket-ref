Refinery::Plugin.register do |plugin|
  plugin.title = "Event Inquiries"
  plugin.name = "event_inquiries"
  plugin.description = "Manage Event Inquiries"
  plugin.version = 1.0
  plugin.activity = {
    :class => EventInquiry,
    :url_prefix => "edit",
    :title => 'date'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

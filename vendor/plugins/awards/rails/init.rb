Refinery::Plugin.register do |plugin|
  plugin.title = "Awards"
  plugin.name = "awards"
  plugin.description = "Manage Awards"
  plugin.version = 1.0
  plugin.activity = {
    :class => Award,
    :url_prefix => "edit",
    :title => 'event_name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

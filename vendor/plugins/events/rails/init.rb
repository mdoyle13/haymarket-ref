Refinery::Plugin.register do |plugin|
  plugin.title = "Events"
  plugin.name = "events"
  plugin.description = "Manage Events"
  plugin.version = 1.0
  plugin.activity = {
    :class => Event,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

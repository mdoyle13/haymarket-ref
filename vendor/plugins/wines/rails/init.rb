Refinery::Plugin.register do |plugin|
  plugin.title = "Wines"
  plugin.name = "wines"
  plugin.description = "Manage Wines"
  plugin.version = 1.0
  plugin.activity = {
    :class => Wine,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

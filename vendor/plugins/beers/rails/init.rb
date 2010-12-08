Refinery::Plugin.register do |plugin|
  plugin.title = "Beers"
  plugin.name = "beers"
  plugin.description = "Manage Beers"
  plugin.version = 1.0
  plugin.activity = {
    :class => Beer,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

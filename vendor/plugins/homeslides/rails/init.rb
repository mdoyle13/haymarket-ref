Refinery::Plugin.register do |plugin|
  plugin.title = "Homeslides"
  plugin.name = "homeslides"
  plugin.description = "Manage Homeslides"
  plugin.version = 1.0
  plugin.activity = {
    :class => Homeslide,
    :url_prefix => "edit",
    :title => 'caption'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

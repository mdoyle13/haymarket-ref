Refinery::Plugin.register do |plugin|
  plugin.title = "Sidebars"
  plugin.name = "sidebars"
  plugin.description = "Manage Sidebars"
  plugin.version = 1.0
  plugin.activity = {
    :class => Sidebar,
    :url_prefix => "edit",
    :title => 'title'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

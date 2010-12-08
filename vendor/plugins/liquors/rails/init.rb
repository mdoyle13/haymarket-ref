Refinery::Plugin.register do |plugin|
  plugin.title = "Liquors"
  plugin.name = "liquors"
  plugin.description = "Manage Liquors"
  plugin.version = 1.0
  plugin.activity = {
    :class => Liquor,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

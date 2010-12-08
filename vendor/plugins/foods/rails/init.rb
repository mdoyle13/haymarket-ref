Refinery::Plugin.register do |plugin|
  plugin.title = "Foods"
  plugin.name = "foods"
  plugin.description = "Manage Foods"
  plugin.version = 1.0
  plugin.activity = {
    :class => Food,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

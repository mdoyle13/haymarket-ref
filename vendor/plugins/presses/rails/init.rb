Refinery::Plugin.register do |plugin|
  plugin.title = "Presses"
  plugin.name = "presses"
  plugin.description = "Manage Presses"
  plugin.version = 1.0
  plugin.activity = {
    :class => Press,
    :url_prefix => "edit",
    :title => 'headline'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

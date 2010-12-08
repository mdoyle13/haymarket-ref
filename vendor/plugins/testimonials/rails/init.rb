Refinery::Plugin.register do |plugin|
  plugin.title = "Testimonials"
  plugin.name = "testimonials"
  plugin.description = "Manage Testimonials"
  plugin.version = 1.0
  plugin.activity = {
    :class => Testimonial,
    :url_prefix => "edit",
    :title => 'name'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end

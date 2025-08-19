require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RailsGallery
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    config.active_model.i18n_customize_full_message = true
  end
end

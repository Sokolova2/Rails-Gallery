require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module RailsGallery
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    config.active_model.i18n_customize_full_message = true

    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ru, :uk]
    config.i18n.fallbacks = true
  end
end

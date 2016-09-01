require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



I18n.enforce_available_locales = false


module MobileLandingCreator
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.i18n.default_locale = 'ru'
  end
end

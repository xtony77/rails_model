require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsModel
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Taipei'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'zh-TW'

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    # set controller layout
    config.to_prepare do
      Admin::ApplicationController.layout "admin"
      Devise::SessionsController.layout "devise_admin"
      Devise::RegistrationsController.layout "admin"
      # Devise::ConfirmationsController.layout "devise_admin"
      # Devise::UnlocksController.layout "devise_admin"            
      Devise::PasswordsController.layout "devise_admin"        
    end

  end
end
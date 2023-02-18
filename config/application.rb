require_relative "boot"
require "active_storage/engine"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testy
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end


# config.action_mailer.delivery_method = :smtp
# config.action_mailer.perform_deliveries = true
# config.action_mailer.raise_delivery_errors = true

# config.action_mailer.smtp_settings = {
#   :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE,
#   :ssl => true,
#   :enable_starttls_auto => true,  #this is the important stuff!
#   :address        => 'smtp.gmail.com',
#   :port           => 465,
#   :domain         => 'gmail.com',
#   :authentication => :plain,
#   :user_name      => 'rjobsamy@gmail.com',
#   :password       => 'FouinyRjob09$'
# }

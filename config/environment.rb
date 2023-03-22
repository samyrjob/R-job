# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

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
  #   :password       =>
  # }


  # config.action_mailer.perform_deliveries = true
# config.action_mailer.raise_delivery_errors = true
# config.action_mailer.default :charset => "utf-8"
  ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
    :password =>  ENV['SENDGRID_API_KEY'], # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'traineenandplus.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

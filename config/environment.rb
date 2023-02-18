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

  ActionMailer::Base.smtp_settings = {
    :user_name => 'notreson@hotmail.fr', # This is the string literal 'apikey', NOT the ID of your API key
    :password => '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', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'https://bestappli.herokuapp.com/',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

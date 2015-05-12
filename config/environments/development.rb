Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.assets.raise_runtime_errors = true

  # URI
  SITE_URI = 'http://localhost:3000'
  
  # APP NAME
  APP_NAME = 'Jabitz'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Local]"

  # AUTH
  AUTH = {'jabitz' => 'marinucci83'}

  # ENV
  E = Rails.env

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "mailer.jabitz.com",
    :user_name => "postmaster@mailer.jabitz.com",
    :password => "8ea42150dd74b9154216302ae0a3552f"
  }

end
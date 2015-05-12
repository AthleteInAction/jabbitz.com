Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_support.deprecation = :stderr
  config.assets.raise_runtime_errors = true
  # config.assets.js_compressor = :uglifier

  # URI
  SITE_URI = 'http://staging.jabitz.com'

  # APP NAME
  APP_NAME = 'Jabitz'

  # PAGE TITLE
  TITLE = "#{APP_NAME} [Beta]"

  # AUTH
  AUTH = {'jabitz123' => 'marinucci83'}

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
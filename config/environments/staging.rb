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
    :address => 'smtp.mailgun.org',
    :port => 587,
    :domain => 'railgun.jabitz.com',
    :user_name => 'postmaster@railgun.jabitz.com',
    :password => '3709f280733116e7a7692b2919ab8593'
  }

  # Zendesk
  ZENDESK_DOMAIN = 'jabitz1431678410'

  # Splash Example IDs
  EIDS = [172,162,152]

end
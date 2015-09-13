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

  # Google API Key
  GKEY = 'AIzaSyDdVQb2QOVd3keNLy7SCnugVlYBojfh-R4'

  # Google Custom Search CX
  GCX = '001317505772620924739%3Aqpshzvvflnm'

end
CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use gCloud storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_provider = 'fog/google' # required
  config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     'xxxxxx',
      google_storage_secret_access_key: 'yyyyyy'
  }
  config.fog_directory = 'name_of_directory'
end
CarrierWave.configure do |config|

  config.fog_provider = 'fog/google' # required
  config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     Rails.application.secrets.google_storage_access_key_id,
      google_storage_secret_access_key: Rails.application.secrets.google_maps_api_key
  }
  config.fog_directory = 'geobox2'

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

end

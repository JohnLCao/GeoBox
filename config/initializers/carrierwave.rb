CarrierWave.configure do |config|

  config.fog_provider = 'fog/google' # required
  config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     'GOOGYWB53C7IH2RNJ7GG',
      google_storage_secret_access_key: 'kIRXrpOs+XeoNCKAqMbT75xmVE1SLAOrVTHfI5t4'
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
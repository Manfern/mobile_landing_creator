# CarrierWave.configure do |config|
#   # config.fog_provider = 'fog/aws'                        # required
#   config.fog_credentials = {
#       provider:              'AWS',                        # required
#       aws_access_key_id:     'AKIAIGHVE4PT2WBVDHGQ',                        # required
#       aws_secret_access_key: 'v++Ueclzobg9nTvwz+sCpAxUMGwU7eHMqFJOhXS',                        # required
#
#
#   }
#   config.fog_directory  = 'mobile-landing-creator'                          # required
#   config.fog_public     = false                                        # optional, defaults to true
#   config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
# end
#
# CarrierWave.configure do |config|
#   config.fog_credentials = {
#
#       :provider                         => 'Google',
#       :google_storage_access_key_id     => Rails.application.secrets.google_storage_access_key_id,
#       :google_storage_secret_access_key => Rails.application.secrets.google_storage_secret_access_key
#
#   }
#
#   config.fog_directory = 'decisive-bazaar-142102'
# end
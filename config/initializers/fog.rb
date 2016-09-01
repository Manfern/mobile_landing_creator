CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJO764BLL2R6LHGHA',
      :aws_secret_access_key  => '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',
  }
  config.fog_directory  = 'mobile-landing777'
  config.fog_public     = false
end
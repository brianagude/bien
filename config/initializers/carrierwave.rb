CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAII6XL66VOECBL2ZQ',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile

  }
  config.fog_directory  = 'bien-reviews'                                      # required

end

require 'carrierwave/mongoid'
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Setting.aws_access_key_id,
    :aws_secret_access_key  => Setting.aws_secret_access_key,
    :region                 => 'ap-southeast-1'
  }

  config.fog_directory  = Setting.aws_s3_bucket
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
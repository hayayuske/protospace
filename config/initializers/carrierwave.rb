CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

case Rails.env
    when 'development'
        config.storage = :file
        config.fog_directory  = 'test-protospace'
        config.asset_host = 'https://s3.amazonaws.com/test-protospace'
    when 'production'
        config.storage = :fog
        config.fog_directory  = 'test-protospace'
        config.asset_host = 'https://s3.amazonaws.com/test-protospace'
    when 'test'
        config.storage = :file
        config.fog_directory  = 'test-protospace'
        config.asset_host = 'https://s3.amazonaws.com/test-protospace'
    end
end

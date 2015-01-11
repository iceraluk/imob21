# Carrierwave Amazon AWS S3 configuration
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => 'eu-west-2'
  }
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = 'imob21'
  config.asset_host     = 'http://imob21.s3.amazonaws.com'
end

if Rails.env.test?
  Fog.mock!

  connection = Fog::Storage.new(
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => 'eu-west-2'
  )
  connection.directories.create(:key => "test", :public => true)
end
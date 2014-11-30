# Carrierwave Amazon AWS S3 configuration
CarrierWave.configure do |config|
  config.validate_unique_filename = false
  config.storage = :fog
  if ENV['RAILS_ENV'] = 'production'
    access_key_id = ENV['ACCESS_KEY_ID']
    secret_access_key = ENV['SECRET_ACCESS_KEY']
  else
    access_key_id = Imob21.config.aws_access_key_id
    secret_access_key = Imob21.config.aws_secret_access_key
  end
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => access_key_id,
      :aws_secret_access_key  => secret_access_key,
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
      :aws_access_key_id      => Imob21.config.aws_access_key_id,
      :aws_secret_access_key  => Imob21.config.aws_secret_access_key,
      :region                 => 'eu-west-2'
  )
  connection.directories.create(:key => "imob21.#{Rails.env}", :public => true)
end
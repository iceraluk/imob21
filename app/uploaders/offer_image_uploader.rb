# encoding: utf-8

class OfferImageUploader < CarrierWave::Uploader::Base
  #include ::CarrierWave::Backgrounder::Delay
  include CarrierWaveDirect::Uploader
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  process :convert => 'png'

  include CarrierWave::MimeTypes
  process :set_content_type

  # Shop version
  version :shop do
    process :resize_to_fill => [640, 640]
  end

  def store_dir
    if model.id
      "uploads/offer_images/#{model.id}"
    else
      "uploads/offer_images/previews"
    end
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def full_filename(for_file)
    filename  = for_file.pathmap("%n")
    extension = for_file.pathmap("%x")
    [version_name, filename].compact.join('_') + extension
  end

  def default_url
    "/assets/" + [version_name, "default_image.png"].compact.join('_')
  end

  def will_include_content_type
    true
  end

  default_content_type  'image/jpeg'

  def full_filename(for_file)
      [version_name, for_file.pathmap("%n")].compact.join('_') + for_file.pathmap("%x")
  end

end

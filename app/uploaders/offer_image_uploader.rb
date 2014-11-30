# encoding: utf-8

class OfferImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  process :convert => 'png'

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process :convert => 'png'

  include CarrierWave::MimeTypes
  process :set_content_type

  version :featured do
    process :resize_to_fill => [246, 162]
  end

  version :post do
    process :resize_to_fill => [830, 323]
  end

  version :listing do
    process :resize_to_fill => [770, 382]
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
    "/assets/" + [version_name, "default_offer_image.png"].compact.join('_')
  end

  def will_include_content_type
    true
  end

  default_content_type  'image/jpeg'

  def full_filename(for_file)
    if model.image_token
      [version_name, model.image_token].compact.join('_') + for_file.pathmap("%x")
    else
      [version_name, for_file.pathmap("%n")].compact.join('_') + for_file.pathmap("%x")
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end

class OfferImage < ActiveRecord::Base
  attr_accessible :image, :offer_id, :position, :key, :image_processed

  belongs_to :offer

  mount_uploaders :image, OfferImageUploader
end

class OfferImage < ActiveRecord::Base
  attr_accessible :image, :offer_id, :position, :key, :image_processed

  belongs_to :offer

  mount_uploader :image, OfferImageUploader

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def create_image_token
    if key.present? && !image_processed
      self.image_token = self.secure_token
    end
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present? && !image_processed
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      offer_image = OfferImage.find(id)
      offer_image.key = key
      offer_image.remote_image_url = URI.decode(offer_image.image.direct_fog_url(:with_path => true))
      offer_image.save!
      offer_image.update_attribute(:image_processed, true)
    end

  end

  def secure_token
    SecureRandom.uuid
  end

end

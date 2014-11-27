class AddImageProcessedToOfferImages < ActiveRecord::Migration
  def change
    add_column :offer_images, :image_processed, :boolean
  end
end

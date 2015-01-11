class AddImageTokenToOfferImages < ActiveRecord::Migration
  def change
    add_column :offer_images, :image_token, :string
  end
end

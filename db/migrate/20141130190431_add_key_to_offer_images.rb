class AddKeyToOfferImages < ActiveRecord::Migration
  def change
    add_column :offer_images, :key, :string
  end
end

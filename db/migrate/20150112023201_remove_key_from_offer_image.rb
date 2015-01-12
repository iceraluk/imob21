class RemoveKeyFromOfferImage < ActiveRecord::Migration
  def up
    remove_column :offer_images, :key
  end

  def down
    add_column :offer_images, :key, :string
  end
end

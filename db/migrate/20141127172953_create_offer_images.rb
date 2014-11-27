class CreateOfferImages < ActiveRecord::Migration
  def change
    create_table :offer_images do |t|
      t.integer :offer_id
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end

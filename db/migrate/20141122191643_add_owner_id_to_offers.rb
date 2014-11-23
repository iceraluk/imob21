class AddOwnerIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :owner_id, :integer
  end
end

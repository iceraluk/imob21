class AddAdminIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :admin_id, :integer
  end
end

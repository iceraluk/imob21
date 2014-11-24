class AddStatusToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :status, :string
  end
end

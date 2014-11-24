class AddExclusivaToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :exclusiva, :boolean
  end
end

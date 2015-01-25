class AddDescriereToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :descriere, :text
  end
end

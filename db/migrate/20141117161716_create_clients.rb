class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :titlu
      t.string :tip_cerere
      t.string :judet
      t.string :oras
      t.string :cartier
      t.string :zone
      t.string :tip_proprietate
      t.datetime :data_limita

      t.timestamps
    end
  end
end

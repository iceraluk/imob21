class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :titlu
      t.boolean :active
      t.string :tip_oferta
      t.string :tip_operatiune
      t.integer :nr_camere
      t.integer :dormitoare
      t.integer :confort
      t.integer :suprafata_utila_mp
      t.integer :nr_bai
      t.integer :nr_balcoane
      t.integer :etaj
      t.integer :nr_etaje
      t.integer :nr_bucatarii
      t.string :parcare
      t.integer :locuri_parcare
      t.string :conditii
      t.string :incalzire
      t.string :orientare
      t.string :compartimentare
      t.boolean :mansarda_imobil
      t.boolean :demisol
      t.string :acoperis
      t.string :structura
      t.integer :nivele
      t.integer :anul_constructiei
      t.string :disponibilitate
      t.string :video
      t.string :judet
      t.string :localitate
      t.string :cartier
      t.string :zona
      t.string :adresa
      t.string :cod_postal
      t.float :latitude
      t.float :longitude
      t.integer :pret_vanzare
      t.string :moneda
      t.integer :pret_inchiriere
      t.string :pret_per
      t.string :comision
      t.integer :negociabil
      t.boolean :sursa

      t.timestamps
    end
  end
end

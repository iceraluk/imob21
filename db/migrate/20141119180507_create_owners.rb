class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :nume
      t.string :prenume
      t.string :telefon1
      t.string :telefon2
      t.string :email1
      t.string :email2
      t.string :cnp
      t.string :adresa
      t.string :judet
      t.string :localitate
      t.string :tara
      t.string :nume_firma
      t.string :adresa_firma
      t.string :nr_inregistrare
      t.string :cui
      t.text :comentarii
      t.datetime :data_nasterii

      t.timestamps
    end
  end
end

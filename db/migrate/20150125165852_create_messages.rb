class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :nume
      t.string :email
      t.text :mesaj

      t.timestamps
    end
  end
end

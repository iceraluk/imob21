class AddNumePrenumeMobileAndFaxToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :mobile, :string
    add_column :admins, :fax, :string
    add_column :admins, :image, :string
    add_column :admins, :nume, :string
    add_column :admins, :prenume, :string
  end
end

class AddOtherColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :genre, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :building_num, :string
    add_column :users, :zip_code, :string
    add_column :users, :apt_num, :string
    add_column :users, :phone, :string
  end
end

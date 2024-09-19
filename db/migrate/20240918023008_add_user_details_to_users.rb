class AddUserDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :active, :boolean
    add_column :users, :address, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date
  end
end

class AddUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.timestamps
    end

    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
  end
end

class AddSessionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.timestamps
    end
    add_column :sessions, :token, :string
    add_belongs_to :sessions, :user
  end
end

class AddTweetsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.timestamps
    end
    add_belongs_to :tweets, :user
  end
end

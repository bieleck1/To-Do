class CreateLists < ActiveRecord::Migration[5.0]
  def up
    create_table :lists do |t|
    	t.string :title, :limit => 75, :null => false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
  	drop_table :lists
  end
end

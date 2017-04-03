class CreateTasks < ActiveRecord::Migration[5.0]
  def up
    create_table :tasks do |t|
    	t.string :title, :limit => 50, :null => false
    	t.boolean :is_done, default: false, null: false
      t.references :list, foreign_key: true

      t.timestamps
    end
  end

  def down
  	drop_table :tasks
  end
end

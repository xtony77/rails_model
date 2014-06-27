class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
    	t.string :group, :null => false, :default => "1"
    	t.text :content
    	t.integer :admin_id, :null => false
      t.timestamps
    end

    add_index :abouts, :group, :unique => true
    add_index :abouts, :admin_id
  end
end

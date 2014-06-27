class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.string :group, :null => false, :default => "1"
    	t.string :title, :null => false
    	t.text :content
    	t.integer :admin_id, :null => false
    	t.string :top, :default => 'no'
      t.timestamps
    end

    add_index :news, :group
    add_index :news, :admin_id
  end
end
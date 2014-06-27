class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.string :group, :null => false, :default => "1"
    	t.string :title, :null => false
    	t.text :content
    	t.integer :admin_id, :null => false
    	t.integer :sequence, :null => false, :default => 0
      t.timestamps
    end

    add_index :albums, :group
    add_index :albums, :admin_id
    add_index :albums, :sequence
  end
end

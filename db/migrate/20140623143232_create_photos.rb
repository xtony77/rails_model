class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
			t.string :group, :null     => false, :default => "1"
			t.integer :album_id, :null => false
			t.integer :admin_id, :null => false
			t.string :name
			t.string :file
			t.string :size
			t.string :content_type
      t.timestamps
    end

    add_index :photos, :group
    add_index :photos, :album_id
    add_index :photos, :admin_id
  end
end

class CreateArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_table :artwork_shares do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false 
      t.timestamps 
    end
    add_index :artwork_shares, :user_id
    add_index :artwork_shares, :artwork_id
  end
end

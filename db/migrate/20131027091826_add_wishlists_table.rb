class AddWishlistsTable < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :title
      t.text :description
      t.text :image
      t.integer :user_id
      t.timestamps
    end
  end
end

class AddBarsWishlistsTable < ActiveRecord::Migration
  def change
    create_table :bars_wishlists, :id => false do |t|
      t.integer :bar_id
      t.integer :wishlist_id
    end
  end
end

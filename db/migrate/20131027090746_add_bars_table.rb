class AddBarsTable < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :email
      t.text :description
      t.text :image
      t.text :address
      t.text :city
      t.text :events
      t.text :opening_hours
      t.timestamps
    end
  end
end

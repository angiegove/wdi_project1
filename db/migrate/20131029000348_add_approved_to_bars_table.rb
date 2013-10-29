class AddApprovedToBarsTable < ActiveRecord::Migration
  def change
    add_column :bars, :approved, :boolean, :default => :false
  end
end

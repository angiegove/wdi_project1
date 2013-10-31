class AddCompanyIdToBarsTable < ActiveRecord::Migration
  def change
    add_column :bars, :company_id, :integer
  end
end

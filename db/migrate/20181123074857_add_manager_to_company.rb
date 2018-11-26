class AddManagerToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :manager_id, :integer
  end
end

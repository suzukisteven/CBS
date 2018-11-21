class AddFirstnameLastnameAgeCompanyPositionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :age, :integer
    add_column :users, :company, :string
    add_column :users, :position, :string
  end
end

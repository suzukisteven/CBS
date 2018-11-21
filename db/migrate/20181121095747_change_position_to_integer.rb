class ChangePositionToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :position, :string
    add_column :users, :position, :integer
  end
end

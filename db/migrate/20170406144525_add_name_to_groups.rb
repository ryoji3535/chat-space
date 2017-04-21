class AddNameToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :name, :string
    add_index :groups, :name, :unique => true
  end
end

class AddAncestryToAdmins < ActiveRecord::Migration[4.2]
  def change
    add_column :admins, :ancestry, :string
    add_index :admins, :ancestry
  end
end

class AddAncestryToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :ancestry, :string
    add_index :admins, :ancestry
  end
end

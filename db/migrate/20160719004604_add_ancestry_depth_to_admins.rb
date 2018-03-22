class AddAncestryDepthToAdmins < ActiveRecord::Migration[4.2]
  def change
    add_column :admins, :ancestry_depth, :integer, :default => 0
  end
end

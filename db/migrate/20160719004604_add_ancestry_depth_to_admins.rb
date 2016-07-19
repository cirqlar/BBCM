class AddAncestryDepthToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :ancestry_depth, :integer, :default => 0
  end
end

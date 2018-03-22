class RenamePasswordInAdminToPasswordDigest < ActiveRecord::Migration[4.2]
  def change
    rename_column :admins, :password, :password_digest
  end
end

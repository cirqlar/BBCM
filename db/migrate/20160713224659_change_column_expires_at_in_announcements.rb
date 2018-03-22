class ChangeColumnExpiresAtInAnnouncements < ActiveRecord::Migration[4.2]
  def change
    change_column :announcements, :expires_at, :date
  end
end

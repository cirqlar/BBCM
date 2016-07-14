class ChangeColumnExpiresAtInAnnouncements < ActiveRecord::Migration
  def change
    change_column :announcements, :expires_at, :date
  end
end

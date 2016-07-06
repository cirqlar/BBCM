class AddExpiresAtToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :expires_at, :datetime
  end
end

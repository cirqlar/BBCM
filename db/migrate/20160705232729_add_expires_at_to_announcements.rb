class AddExpiresAtToAnnouncements < ActiveRecord::Migration[4.2]
  def change
    add_column :announcements, :expires_at, :datetime
  end
end

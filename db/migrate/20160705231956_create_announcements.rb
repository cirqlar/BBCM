class CreateAnnouncements < ActiveRecord::Migration[4.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :desc

      t.timestamps null: false
    end
  end
end

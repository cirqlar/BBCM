class CreateAudios < ActiveRecord::Migration[5.1]
  def change
    create_table :audios do |t|
      t.string :audio
      t.string :title
      t.text :description
      t.string :poster
      t.string :media_tmp
      t.boolean :media_processing, null: false, default: false

      t.timestamps
    end
  end
end

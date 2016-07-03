class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :media
      t.string :title
      t.text :description
      t.string :poster

      t.timestamps null: false
    end
  end
end

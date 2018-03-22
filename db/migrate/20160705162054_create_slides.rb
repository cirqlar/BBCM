class CreateSlides < ActiveRecord::Migration[4.2]
  def change
    create_table :slides do |t|
      t.string :image
      t.string :title
      t.text :desc

      t.timestamps null: false
    end
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :event
      t.string :people

      t.timestamps null: false
    end
  end
end

class AddImageProcessingToImages < ActiveRecord::Migration[4.2]
  def change
    add_column :images, :image_processing, :boolean, null: false, default: false
  end
end

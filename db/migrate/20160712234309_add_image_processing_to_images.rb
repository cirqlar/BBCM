class AddImageProcessingToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_processing, :boolean, null: false, default: false
  end
end

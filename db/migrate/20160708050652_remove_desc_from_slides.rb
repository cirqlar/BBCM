class RemoveDescFromSlides < ActiveRecord::Migration[4.2]
  def change
    remove_column :slides, :desc, :text
  end
end

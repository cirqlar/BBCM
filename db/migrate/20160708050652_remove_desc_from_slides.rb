class RemoveDescFromSlides < ActiveRecord::Migration
  def change
    remove_column :slides, :desc, :text
  end
end

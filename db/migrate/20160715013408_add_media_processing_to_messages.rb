class AddMediaProcessingToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :media_processing, :boolean, null: false, default: false
  end
end

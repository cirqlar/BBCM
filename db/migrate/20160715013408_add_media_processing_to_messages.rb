class AddMediaProcessingToMessages < ActiveRecord::Migration[4.2]
  def change
    add_column :messages, :media_processing, :boolean, null: false, default: false
  end
end

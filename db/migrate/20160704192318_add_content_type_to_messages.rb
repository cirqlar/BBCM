class AddContentTypeToMessages < ActiveRecord::Migration[4.2]
  def change
    add_column :messages, :content_type, :string
  end
end

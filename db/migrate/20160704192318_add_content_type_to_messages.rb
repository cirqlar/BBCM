class AddContentTypeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :content_type, :string
  end
end

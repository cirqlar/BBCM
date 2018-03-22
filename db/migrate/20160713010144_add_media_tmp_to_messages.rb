class AddMediaTmpToMessages < ActiveRecord::Migration[4.2]
  def change
    add_column :messages, :media_tmp, :string
  end
end

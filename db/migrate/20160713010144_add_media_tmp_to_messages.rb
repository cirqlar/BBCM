class AddMediaTmpToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :media_tmp, :string
  end
end

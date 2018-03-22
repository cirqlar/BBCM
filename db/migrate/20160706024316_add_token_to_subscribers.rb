class AddTokenToSubscribers < ActiveRecord::Migration[4.2]
  def change
    add_column :subscribers, :token, :string
  end
end

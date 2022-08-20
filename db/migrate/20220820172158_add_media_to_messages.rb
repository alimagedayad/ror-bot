class AddMediaToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :media_link, :string
  end
end

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.string :text
      t.string :type

      t.timestamps
    end
  end
end

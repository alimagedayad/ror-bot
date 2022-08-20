class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.integer :chat_id

      t.timestamps
    end
  end
end

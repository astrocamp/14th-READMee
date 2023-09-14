class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.text :user_message
      t.text :gpt_reply
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

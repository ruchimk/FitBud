class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.string :title
      t.text :body, null: false

      t.timestamps
    end
  end
end

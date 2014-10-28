class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_id, null: false
      t.integer :partner_id, null: false
      t.string :message
      t.string :status, null: false, default: "" #pending requested or confirmed

      t.timestamps
    end

    add_index :matches, :user_id
    add_index :matches, :partner_id
    add_index :matches, [:user_id, :partner_id]
  end
end

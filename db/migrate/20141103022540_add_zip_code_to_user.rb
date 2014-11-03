class AddZipCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :integer, limit:2
  end
end

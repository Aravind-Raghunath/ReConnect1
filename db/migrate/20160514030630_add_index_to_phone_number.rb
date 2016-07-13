class AddIndexToPhoneNumber < ActiveRecord::Migration[5.0]
  def change
    add_index :alumni, :phone_number, unique: true
  end
end

class AddPhoneNumberVerfiedAtToAlumni < ActiveRecord::Migration[5.0]
  def change
    add_column :alumni, :phone_number_verified_at, :datetime
  end
end

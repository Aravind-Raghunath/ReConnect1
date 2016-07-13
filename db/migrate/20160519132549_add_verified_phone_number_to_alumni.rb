class AddVerifiedPhoneNumberToAlumni < ActiveRecord::Migration[5.0]
  def change
    add_column :alumni, :verified_phone_number, :string
  end
end

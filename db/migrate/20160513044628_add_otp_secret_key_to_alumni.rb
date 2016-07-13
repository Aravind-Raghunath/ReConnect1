class AddOtpSecretKeyToAlumni < ActiveRecord::Migration[5.0]
  def change
    add_column :alumni, :otp_secret_key, :string
  end
end

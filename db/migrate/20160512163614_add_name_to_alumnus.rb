class AddNameToAlumnus < ActiveRecord::Migration[5.0]
  def change
    add_column :alumni, :name, :string

    add_column :alumni, :date_of_birth, :date
    add_column :alumni, :date_of_marraige, :date

    add_column :alumni, :usn, :string
    add_column :alumni, :year_of_passing, :string
    add_column :alumni, :branch, :string

    add_column :alumni, :phone_number, :string
  end
end

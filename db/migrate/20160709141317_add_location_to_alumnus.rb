class AddLocationToAlumnus < ActiveRecord::Migration[5.0]
  def change
    add_column :alumni, :location, :string
  end
end

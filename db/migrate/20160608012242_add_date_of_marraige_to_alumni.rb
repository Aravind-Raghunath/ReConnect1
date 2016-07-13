class AddDateOfMarraigeToAlumni < ActiveRecord::Migration[5.0]
  def change
    add_column :alumni, :date_of_marraige, :date
  end
end

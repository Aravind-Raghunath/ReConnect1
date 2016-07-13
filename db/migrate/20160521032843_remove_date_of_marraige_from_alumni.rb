class RemoveDateOfMarraigeFromAlumni < ActiveRecord::Migration[5.0]
  def change
    remove_column :alumni, :date_of_marraige, :string
  end
end

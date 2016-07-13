class RenameDateOfMarraigeToDateOfMarriage < ActiveRecord::Migration[5.0]
  def change
    rename_column :alumni, :date_of_marraige, :date_of_marriage
  end
end

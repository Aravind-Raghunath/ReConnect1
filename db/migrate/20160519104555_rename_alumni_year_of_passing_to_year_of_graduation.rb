class RenameAlumniYearOfPassingToYearOfGraduation < ActiveRecord::Migration[5.0]
  def change
    rename_column :alumni, :year_of_passing, :year_of_graduation
  end
end

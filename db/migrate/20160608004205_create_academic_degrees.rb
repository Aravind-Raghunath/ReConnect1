class CreateAcademicDegrees < ActiveRecord::Migration[5.0]
  def change
    create_table :academic_degrees do |t|
      t.string :name
      t.integer :year_of_graduation
      t.string :college_or_university
      t.belongs_to :alumnus, foreign_key: true

      t.timestamps
    end
  end
end

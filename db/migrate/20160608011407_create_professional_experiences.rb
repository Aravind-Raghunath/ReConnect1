class CreateProfessionalExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :professional_experiences do |t|
      t.string :company_name
      t.string :designation
      t.belongs_to :alumnus, foreign_key: true

      t.timestamps
    end
  end
end

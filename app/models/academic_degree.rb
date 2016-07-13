class AcademicDegree < ApplicationRecord
  belongs_to :alumnus

  validates :name, :college_or_university, :year_of_graduation, presence: true
  validates :year_of_graduation, numericality: { greater_than_or_equal_to: 2006, less_than_or_equal_to: 2020 }
end

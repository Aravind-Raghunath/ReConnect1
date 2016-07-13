class ProfessionalExperience < ApplicationRecord
  belongs_to :alumnus

  validates :company_name, :designation, presence: true
end

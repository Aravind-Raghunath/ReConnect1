require 'net/http'
require 'uri'

class Alumnus < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, on: :create

  # https://github.com/plataformatec/devise/issues/1623
  validates :name, :date_of_birth, :phone_number,
            :year_of_graduation, :branch,
            presence: true, on: :update,
            unless: Proc.new { |u| u.encrypted_password_changed? }

  validates :phone_number,
            format: { with: /\A(\+\d{1,6}|)\d{10}\z/ },
            uniqueness: true,
            unless: lambda { phone_number.nil? }

  validates :year_of_graduation,
            numericality: { greater_than_or_equal_to: 2006, less_than_or_equal_to: 2020 } unless lambda { year_of_graduation.nil? }

  validates :usn, format: { with: /\A[1][b][y]\d{2}[a-zA-Z]{2}(\d{1}|[a-zA-Z]{1})\d{2}\z/i },
            uniqueness: true, unless: lambda { usn.blank? }

  validates :verified_phone_number, uniqueness: true,
            unless: lambda { verified_phone_number.nil? }

  has_one_time_password

  has_many :academic_degrees, dependent: :destroy
  accepts_nested_attributes_for :academic_degrees, reject_if: :all_blank,
                                allow_destroy: true

  has_many :professional_experiences, dependent: :destroy
  accepts_nested_attributes_for :professional_experiences, reject_if: :all_blank,
                                allow_destroy: true

  before_save :upcase_usn

  has_many :posts

  def send_otp
    authkey = ENV["MSG91_AUTH_KEY"] # Your authentication key.

    mobiles = self.phone_number # Multiple mobiles numbers separated by comma.

    message = "Hello #{self.name}! Your verification code is #{self.otp_code}.\nReConnect BMSITM" # Your message to send.

    sender = 'BMSITM' # Sender ID,While using route4 sender id should be 6 characters long.

    route = '4' # Define route

    values = {
      'authkey' => authkey,
      'mobiles' => mobiles,
      'message' => message,
      'sender' => sender,
      'route' => route
    }

    uri = URI('http://api.msg91.com/api/sendhttp.php')
    res = Net::HTTP.post_form(uri, values)
    Rails::logger.info "SMS to #{self.phone_number}, return value : #{res}"
  end

  private

  def upcase_usn
    self.usn = self.usn.upcase if self.usn
  end
end

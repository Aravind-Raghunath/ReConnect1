class PagesController < ApplicationController

  skip_before_action :authenticate_alumnus!

  def index
    if current_alumnus && (current_alumnus.phone_number.nil? ||
       current_alumnus.date_of_birth.nil? ||
       current_alumnus.year_of_graduation.nil? ||
       current_alumnus.branch.nil?)
      redirect_to almost_done_path
    elsif current_alumnus && current_alumnus.phone_number_verified_at.nil?
      redirect_to otp_path
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_alumnus!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def resource_name
    :alumnus
  end

  def resource
    @resource ||= Alumnus.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:alumnus]
  end

  helper_method :resource_name, :resource, :devise_mapping

  def after_sign_in_path_for(alumnus)
    almost_done_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [
                                        :name,
                                        :date_of_birth,
                                        :phone_number,
                                        :usn,
                                        :year_of_graduation,
                                        :branch,
                                        :location,
                                        :date_of_marriage,
                                        academic_degrees_attributes: [
                                          :id,
                                          :name,
                                          :year_of_graduation,
                                          :college_or_university,
                                          :_destroy
                                        ],
                                        professional_experiences_attributes: [
                                          :id,
                                          :company_name,
                                          :designation,
                                          :_destroy
                                        ]
                                      ])
  end
end

class RegistrationsController < Devise::RegistrationsController

  def almost_done
    self.resource = current_alumnus
    if !current_alumnus.phone_number.nil? && !current_alumnus.date_of_birth.nil? &&
       !current_alumnus.year_of_graduation.nil? && !current_alumnus.branch.nil?
      redirect_to otp_path
    end
  end

  def complete_profile
    self.resource = current_alumnus
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource_without_password(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true

      current_alumnus.send_otp
      redirect_to otp_path, notice: "A text message with the verification code was sent to #{current_alumnus.phone_number}."

    else
      clean_up_passwords resource
      render 'almost_done'
    end
  end

  def otp
    unless current_alumnus.phone_number_verified_at.nil?
      redirect_to root_path
    end
  end

  def send_otp
    current_alumnus.send_otp
    redirect_to otp_path, notice: "A text message with the verification code was sent to #{current_alumnus.phone_number}."
  end

  def check_otp
    user = current_alumnus
    if user.authenticate_otp(params['otp'], drift: 300)
      user.phone_number_verified_at = Time.now
      user.verified_phone_number = user.phone_number
      user.save!
      redirect_to root_path, notice: 'Your phone number has been successfully verified.'
    else
      redirect_to otp_path, alert: 'The verification code entered was incorrect or this number already exists.'
    end
  end

  protected

  def update_resource_without_password(resource, params)
    resource.update_without_password(params)
  end
end

class AlumniController < ApplicationController

  skip_before_action :authenticate_alumnus!, only: :index
  http_basic_authenticate_with name: 'Admin', password: 'bangalore64'

  def index
    @alumni = Alumnus.where.not(phone_number_verified_at: nil)
    if params['branch']
      @alumni = @alumni.where(branch: params['branch'])
    end
  end
end

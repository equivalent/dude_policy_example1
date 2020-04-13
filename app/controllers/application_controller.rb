class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Devise gem - require log in user

  # DudePolicy::NotAuthorized is a error class provided by `dude_policy` gem so
  # you can implement it in your application for rescue_from flow
  rescue_from DudePolicy::NotAuthorized do
    respond_to do |format|
      format.html { redirect_to root_path, alert: "Sorry current user is not authorized to perform this action" }
      format.js { render js: 'alert("Not authorized");', status: 403   }
      format.json { render json: { status: 403, error: 'not authorized - current user not permitted to do this action' }, status: 403 }
    end
  end

  private

  def authorize!(condition)
    raise DudePolicy::NotAuthorized unless condition
  end
end

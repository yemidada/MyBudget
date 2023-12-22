class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  before_action :set_groups_variable

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

  private

  def set_groups_variable
    @groups = Group.all
  end
end

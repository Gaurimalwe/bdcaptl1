class ApplicationController < ActionController::Base
 protect_from_forgery

  private

  def current_owner
    #@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    @current_owner ||= CreateOwner.where("auth_token =?", cookies[:auth_token]).first if cookies[:auth_token]
  end
helper_method :current_owner
def current_admin
    #@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    @current_admin ||= Owner.where("auth_token =?", cookies[:auth_token]).first if cookies[:auth_token]
  end
  
helper_method :current_admin
end

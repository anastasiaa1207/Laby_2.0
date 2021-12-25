class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :require_login

  private

  def require_login
    redirect_to sessions_login_url unless signed_in?
  end
end
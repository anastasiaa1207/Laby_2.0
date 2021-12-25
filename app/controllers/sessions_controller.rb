class SessionsController < ApplicationController

  skip_before_action :require_login, only: %i[login create logout]
  def login; end

  def create
    user = User.find_by username: params[:username]

    if user&.authenticate(params[:password])
      p 'LOGIN'
      sign_in user
      redirect_to root_url
    else
      p 'REDIRECT'
      redirect_to sessions_login_url
    end
  end

  def logout
    sign_out
    redirect_to sessions_login_url
  end
end

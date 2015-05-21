class SessionsController < ApplicationController
  def index
    render('new')
  end

  def create
    create_owner = CreateOwner.find_by_username(params[:username])
    if create_owner && create_owner.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = create_owner.auth_token
      else
        cookies[:auth_token] = create_owner.auth_token
      end
      redirect_to root_url
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to '/home'
  end
end

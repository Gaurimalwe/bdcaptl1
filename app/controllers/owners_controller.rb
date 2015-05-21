class OwnersController < ApplicationController
   def index
    render('new')
  end

  def create
    owner = Owner.find_by_email(params[:email])
    if owner && owner.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = owner.auth_token
      else
        cookies[:auth_token] = owner.auth_token
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
=begin
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(params[:owner])
    if @owner.save
      redirect_to '/login', :notice => "Signed up!"
    else
      render "new"
    end
  end

=end

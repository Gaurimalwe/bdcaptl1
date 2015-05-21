class AcessRightController < ApplicationController

def new
    @acess_right = AcessRight.new
  end
def show
    @acess_right = AcessRight.order("acess_right.id ASC")

  end
  
  def create
    # Instantiate a new object using form parameters
    @acess_right = AcessRight.new(params[:acess_right])
    # Save the object
    if @acess_right.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Page created."
      redirect_to root_url
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
end

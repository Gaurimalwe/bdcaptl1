class CreateOwnerController < ApplicationController
 def index
    list
    render('list')
  end
  def housing_society
    render('housing_society')
  end

  def access_right
   @create_owners = CreateOwner.order("create_owners.username ")
  end
  def report
   render('report')
  end
  def sms
   render('sms')
  end
  def list
    @create_owners = CreateOwner.order("create_owners.id ASC")
  end
  
  def show
    @create_owner = CreateOwner.find(params[:id])
  end
  
  def new
    @create_owner = CreateOwner.new
  end
  
  def create
    # Instantiate a new object using form parameters
    @create_owner = CreateOwner.new(params[:create_owner])
    # Save the object
    if  @create_owner.save
      # If save succeeds, redirect to the list action
      #flash.now.alert = "New User Created"
      redirect_to :action => 'list' , :notice => "nwe user"
      flash.now.alert = "New User Created!!"
    else
      # If save fails, redisplay the form so user can fix problems
      redirect_to :action => 'new', :notice => "Error!!!!"
    end
  end
  
  def edit
    @create_owner = CreateOwner.find(params[:id])
  end
  
  def update
    # Find object using form parameters
    @create_owner = CreateOwner.find(params[:id])
    # Update the object
    if @create_owner.update_attributes(params[:create_owner])
      # If update succeeds, redirect to the list action
      redirect_to(:action => 'list', :id => @create_owner.id)
      flash.now.alert = "User Successfully updated!!"
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
  
  def delete
    @create_owner = CreateOwner.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to :action => 'list', notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=begin  
  def destroy
    CreateOwner.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

def destroy
    @create_owner.destroy
    respond_to do |format|
      format.html { redirect_to :action => 'list', notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

=end
 
  def logout
     session[:create_owner_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/login"
  end



end

class MessageController < ApplicationController
def index
    list
    render('new')
  end
  
  def list
    @messages = Message.all
  end
  
  def show
    @message = Message.find(params[:id])
  end
  
  def new
    @message= Message.new
  end
def sms
     @message = Message.find(params[:id])
  end
  
  def create
    params[:message].parse_time_select! :start_time
    params[:message].parse_time_select! :end_time
    # Instantiate a new object using form parameters
    @message = Message.new(params[:message])
    # Save the object
    if  @message.save
      MessageMailer.registration_confirmation(@message).deliver
      # If save succeeds, redirect to the list action
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render "new"
    end
  end
  
  def delete
   # @message = Message.find(params[:id])
    @message = Message.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to :action => 'list', notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  
  end

require "net/http"
require "uri"

#this function returns the reference id of the transaction when the message is sent
  #it can be used for checking the message status
  def sms_gateway

    #for SMS gateway integration
    @message = Message.find(params[:id])
    mob = @message.mob_nos
    y = mob.split(',')
    y.each do |v|
    uri = URI.parse("http://u.vsms.in/SendSMS/sendmsg.php")
    params = { 'uname' => 'BDCInf',
               'pass'  => '12345678',
               'send'  => 'BDFInf',
               'dest'  => v.to_i,
               'msg'   => 'Dear Member,
You are hereby informed that the next meeting for, ' + @message.title + ' is scheduled on ' + @message.start_date + ' at ' + @message.start_time.strftime("%H:%M") + '. Kindly be present.'

               #'msg'   => 'Dear Shri / SMT '+current_user.full_name+',please enter the OTPcode '+@question.otp+' in the GLAQMSsystem. Goa Legislative Assembly'
    }

    begin
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.path)
      request.set_form_data( params )

      # instantiate a new Request object
      request = Net::HTTP::Get.new( uri.path+ '?' + request.body )

      response = http.request(request)
      response.body

    rescue Exception => exc
      logger.error("Message for the log file #{exc.message}")
      flash[:alert] = t("Please Check your Internet Connection!!!")
    end
end
 redirect_to(:action => 'list')

  end
  
  
=begin
 def destroy
    Message.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end
=end
# private
 # def stud_params
#params.require(:message).permit(:project, :title, :start_date, :end_date, :start_time, :end_time, :minute_taker, :attendee, :place, :about_meeting, :topic, :type_o, :note, :owner)
 #  end

end

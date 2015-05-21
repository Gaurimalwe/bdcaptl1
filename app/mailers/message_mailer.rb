class MessageMailer < ApplicationMailer
default :from => "mymaildiksha@gmail.com"
  
  def registration_confirmation(message)
    @message = message
    recipient = message.attendee
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => recipient, :subject => "Meeting")
  end
end

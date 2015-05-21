class Message < ActiveRecord::Base
  # attr_accessible :title, :body
          
validates :title,
          :presence => {:message => "Title can't be blank." },   
          :format => { :with => /^[A-Za-z]*$/ }  ,
          :length => { :maximum => 255, :message => "Title field must be max 255 characters" }
        

validates :start_date, :presence => true, :allow_blank => false

#validates_presence_of :end_date

#validate :end_after_start_date

validates_presence_of :start_time
validates :end_time, :presence => true

validate :end_after_start_time
         

validates :minute_taker,
          :presence => true,   
          :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

=begin
private
def end_after_start_date
  return if end_date.blank? || start_date.blank?

 start = Date.strptime(start_date, '%m/%d/%Y')
 endd = Date.strptime(end_date, '%m/%d/%Y')

  if end_date < start_date
    errors.add(:end_date, "must be after the start date") 
  end 
 end
=end

private
def end_after_start_time
  #return if end_time.blank? || start_time.blank?
   
  #start = start_time.strftime("%H:%M")
 #endd = end_time.strftime("%H:%M")

 #start_time.utc
 #end_time.utc

  if end_time < start_time
    errors.add(:end_time,"must be after the start time") 
  end 
 end
end

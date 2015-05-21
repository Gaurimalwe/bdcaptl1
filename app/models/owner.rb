class Owner < ActiveRecord::Base
before_create { generate_token(:auth_token) }
  attr_accessible :email, :password, :password_confirmation
  has_secure_password


validates_presence_of :email
validates_presence_of :password, :on => :create
validates_format_of :password, 
                    :with => /^[A-Za-z0-9 ~ ` ! @ # $ % ^ & * ( ) - _ = + \ | ; : ' " , . ? \/ < > \[ \] \{ \} ]*$/, 
                    :message => "should only contain letters, numbers, or .-_@"

validates_length_of :password, :within => 8..15
validates_confirmation_of :password
validates_uniqueness_of :email






  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Owner.exists?(column => self[column])
  end
end




 

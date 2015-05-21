class CreateOwner < ActiveRecord::Base
 has_many :file_uploads
before_create { generate_token(:auth_token) }


validates_presence_of :name
validates_format_of :name,
                    :with => /\w+/, 
                    :message => " Can only contain characters "
validates_format_of :name,
                    :with => /[A-Z]/, 
                    :message => "Characters only or must have one upper case"
validates_length_of :name, :within => 1..25

validates_presence_of :floor
validates_length_of :floor, :within => 1..15
validates_format_of :floor, 
                    :with => /^[1-5]*$/, 
                    :message => "Numbers only limit <= 5"

validates_presence_of :block
validates :block, :format => { :with => /^[a-z0-9]+[-a-z0-9]*[a-z0-9]+$/i }


validates_presence_of :flat_number
validates_length_of :flat_number, :within => 1..15
validates_format_of :flat_number, 
                    :with => /^[0-9]*$/, 
                    :message => "Enter valid flat number"


validates_length_of :business_name, :within => 1..25
validates_format_of :business_name,
                    :with => /[A-Z]/, 
                    :message => "Characters only or must have one upper case"


validates_presence_of :carpet_area
validates_length_of :carpet_area, :within => 1..5

validates_presence_of :builtup_area
validates_length_of :builtup_area, :within => 1..5

validates_presence_of :mezzanine
validates_presence_of :water_connection
validates_presence_of :electricity
validates_presence_of :ownership
validates_presence_of :per_month_rent


validates :username, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates_uniqueness_of :username

validates_presence_of :password
validates_format_of :password, 
                    :with => /^[A-Za-z0-9 ~ ` ! @ # $ % ^ & * ( ) - _ = + \ | ; : ' " , . ? \/ < > \[ \] \{ \} ]*$/, 
                    :message => "Cannot be blank"

validates_length_of :password, :within => 8..15
validates_confirmation_of :password


mount_uploader :image, PictureUploader




has_secure_password


def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while CreateOwner.exists?(column => self[column])
end

=begin
def encrypt_password
  self.password_salt = BCrypt::Engine.generate_salt
  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
end

def self.authenticate(username, password)
 create_owner = CreateOwner.where(username: username).first
 if create_owner && create_owner.password_hash == BCrypt::Engine.hash_secret(password, create_owner.password_salt)
   create_owner
 else
   nil
 end
end
=end

def self.authenticate(username, password) 
    find(:first, :conditions=>["username = ? AND password = ?", username, 
pass])  # login, password are your users table fields.. 
  end 



end

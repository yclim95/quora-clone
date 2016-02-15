require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
# attr_accessor :password
  has_secure_password

  validates :user_name, :presence => true
  validates :email, :presence => true,
                    :format =>  { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ },
                    :uniqueness => { :case_sensitive => false }
  # validates :password_digest, :presence => true

# before_save :encrypt_password
  def self.authenticate(email,password)
  @user = User.find_by(email: email)

    if @user && @user.authenticate(password) # means the user email is found in database, and the password is authenticated
    @user
    else
      return false
    end
  end
end

# def encrypt_password
#   if password.present?
#     self.salt = BCrypt::Engine.generate_salt
#     self.encrypted_passsword = BCrype::Engine.hash_secret(password, salt)
#   end
# end
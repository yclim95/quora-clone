require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy

  has_many :question_votes, :dependent => :destroy
  has_many :answer_votes, :dependent => :destroy

  has_many :voted_questions, :through => :question_votes, :source => :question  #Will get the votes/likes
  has_many :voted_answers, :through => :answer_votes, :source => :answer  #Will get the votes/likes
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

  def user_votable_for_questions?(question) 
    # Check (when current user posted) --> return false if user try to post answer
   question.user == self
     #question && question.user != self && !question_votes.exists?(question_id: question.id)
 end


 def user_vote_questions_valid?(user,question)
    #Check if user have vote more than ONE 
    byebug  
    if user.voted_questions.count == 0 #Not that particular questions 
      return true
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


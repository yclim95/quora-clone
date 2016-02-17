class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_votes
  has_many :answer
  has_many :voters_questions, :through => :question_votes, :source => :user  #Question that have votes from the user 

  validates :title, :presence => true
  validates :subject, :presence => true
end
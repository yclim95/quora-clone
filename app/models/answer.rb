class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :answer_votes

  has_many :voters_answers, :through => :answer_votes, :source => :user  #Question that have votes from the user 
  validates :text, :presence => true
end
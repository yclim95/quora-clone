class QuestionVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
    validates :user, uniqueness: { scope: :question,
    message: "User is unable to vote for more than 2 types" }
end
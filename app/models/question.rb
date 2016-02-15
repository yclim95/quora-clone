class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence => true
  validates :subject, :presence => true
end
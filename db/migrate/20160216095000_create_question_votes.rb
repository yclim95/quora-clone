class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :counter
			t.integer :question_id
			t.integer :user_id
			t.timestamps null: false
		end
	end
end
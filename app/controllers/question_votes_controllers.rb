post '/questions/:question_id/question_votes/:question_vote_id/update' do  #To Update 
  if logged_in?
	@question = Question.find(params[:question_id])
	new_vote = current_user.question_votes.new(:question => @question)  #Push in a new records to a new row
	if new_vote.save
		redirect "/questions/#{@question.id}"
	else 
	  flash[:error] = "You are not allowed to vote for questions you have posted!"
	  redirect "/questions/#{@question.id}"
	end 
	
  else
	flash[:notice] = "You are not logged_in ! Please sign in to answer"
	@question = Question.find(params[:question_id])
	redirect "/questions/#{@question.id}"
  end
end
 
post '/questions/:question_id/question_votes/:question_vote_id/destroy' do  #Destroy
  if logged_in?
	@question = Question.find(params[:question_id])
	new_vote = current_user.voted_questions.destroy(@question)
	redirect "/questions/#{@question.id}"
	
  else
	flash[:notice] = "You are not logged_in ! Please sign in to answer"
	@question = Question.find(params[:question_id])
	redirect "/questions/#{@question.id}"
  end
end


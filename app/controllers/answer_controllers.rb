require 'sinatra'
require 'sinatra/flash'

enable :sessions

set :public_folder, 'public'
post '/answers/questions/:question_id' do  #Post Answer

  if logged_in?
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer].merge(user_id: @user.id, question_id: @question.id))
    if @answer.save  
     redirect "/answers/questions/#{@question.id}"
    else
      redirect '/'
    end

  else  # If user is "NOT" LOGGED IN

    flash[:notice] = "You are not logged_in ! Please sign in to answer"
    @question = Question.find(params[:question_id])
    redirect "/questions/#{@question.id}"
  end
end

get '/answers/questions/:question_id' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @answers = Answer.where(question_id: @question.id)
  erb :"static/question_index"
end
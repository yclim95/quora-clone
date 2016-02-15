require 'sinatra'
require 'sinatra/flash'

enable :sessions

post '/answers/questions/:question_id' do

  if logged_in?
    @answer = Answer.new(params[:answer])
    if @answer.save

     redirect '/'
    else
      redirect '/'
    end

  else  # If user is not LOGGED IN

    flash[:notice] = "You are not logged_in ! Please sign in to answer"
    @question = Question.find(params[:question_id])
    redirect "/questions/#{@question.id}"
  end
end
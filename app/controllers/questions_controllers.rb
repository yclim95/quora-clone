set :public_folder, 'public'

get '/questions/new' do
  @user = current_user
  erb :"static/questions"
end

post '/questions' do  
  @user = current_user
  @question = Question.new(params[:question].merge(user_id: @user.id))
  if @question.save
   redirect '/users/questions'
  else
    redirect '/questions/new'
  end
end

get '/questions/:question_id' do
  @user = current_user
  @question = Question.find(params[:question_id])
  @answers = Answer.where(question_id: @question.id)
  erb :"static/question_index"
end
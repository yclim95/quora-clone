get '/' do
  @questions = Question.all
  erb :"static/index"
end

post '/signup' do
	@user = User.new(params[:user])
  	if @user.save
      session[:current_user_id] = @user.id # logging in the user
       redirect '/'
  	else
      erb :"static/error"
  	end
end

post '/login' do

 if @user= User.authenticate(params[:user][:email], params[:user][:password])  #If it is authenticate
  session[:current_user_id] = @user.id
  redirect '/'
 else
  redirect '/'
 end
end

get '/signout' do
  @_current_user = session[:current_user_id] = nil   # Remove the user id from the session
  redirect '/'
end

get'/users/questions' do
  @user = current_user

  erb :"static/user_questions"
end

get '/users/:id' do
  erb :"static/user_profile"
end


# @user = User.find_by(email: params[:email])

#   if @user && @user.authenticate(params[:user][:password]) # means the user email is found in database, and the password is authenticated
#     redirect '/'
#   else
#     redirect '/'
#   end
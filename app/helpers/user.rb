helpers do
  def current_user
    if session[:current_user_id]
     @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
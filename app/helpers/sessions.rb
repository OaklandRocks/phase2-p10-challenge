helpers do

  def current_user
    if User.count > 0
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      nil
    end
  end

end
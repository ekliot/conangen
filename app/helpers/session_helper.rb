module SessionHelper
  
  def log_in(user)
    session[:user] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

end

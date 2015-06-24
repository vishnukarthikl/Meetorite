module SessionsHelper
  def log_in(user, remember_me)
    if remember_me == '1'
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
  end

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.delete(:auth_token)
    @current_user = nil
  end

end

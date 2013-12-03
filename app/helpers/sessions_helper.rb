module SessionsHelper
  def sign_in(user, remember_me)
    if (remember_me)
      cookies.permanent[:remember_token] = user.remember_token
    else
      cookies[:remember_token] = user.remember_token
    end

    current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    current_user == user
  end

  def signed_in?
    !current_user.nil?
  end

  def signout
    current_user = nil
    cookies[:remember_token] = nil
  end
end

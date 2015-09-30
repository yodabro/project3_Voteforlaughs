class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_current_user, :ensure_admin

  before_action :ensure_users


  private
  def login!(user)
    session[:current_user_id] = user.id
  end

  def logout!
    session[:current_user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def ensure_users
    unless current_user
      @user = User.new
      @comedian = User.new
    end
  end

  def require_current_user
    unless current_user
      flash[:message] = "You must be signed in to do that!"
      redirect_to new_user_path
    end
  end

  def ensure_admin
    if current_user.user?
      flash[:message] = "You must be an admin to access this page!"
      redirect_to new_user_path
    end

  end
end

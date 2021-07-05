class SessionsController < ApplicationController
  helper_method :current_user, :log_out, :current_user?, :log_in
  # Render the new.html.erb template (The login form)
  def new
  end

  # Don't render a template, just create the session
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Welcome.'
      redirect_back_or articles_path
    else
      flash.now[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user) 
    user == current_user
  end

end

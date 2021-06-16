class SessionsController < ApplicationController

  # Render the new.html.erb template (The login form)
  def new

  end

  # Don't render a template, just create the session
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
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
end

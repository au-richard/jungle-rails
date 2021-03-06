class SessionsController < ApplicationController

  def new
  end

  def create
    # If user exists AND the password is correct.
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Saves user id inside browser cookie. Can keep the user logged in when they navigate the site.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user can't login, redirect back to login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If user exists AND the password is correct.
    if user && user.authenticate(params[:password])
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

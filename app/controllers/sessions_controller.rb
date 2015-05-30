class SessionsController < ApplicationController
  def new
    # store the page in session to return to after login
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to session.delete(:return_to) || root_url # return to the previous page
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end

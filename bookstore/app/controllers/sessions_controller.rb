class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # password_login = User.new(password: params[:session][:password])

    # if user.password == password_login.password
    #   log_in user
    #   redirect_to :users
    # else
    #   redirect_to :new_user

    if user && user.authenticate(params[:session][:password])
      UserMailer.welcome_email(user).deliver_now
      log_in(user)
      redirect_to :users
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end

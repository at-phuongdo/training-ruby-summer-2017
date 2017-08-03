class ResetPasswordsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:reset_password][:email].downcase)
    if @user
      @user.create_reset_password_token
      @user.send_reset_password_token
      redirect_to reset_passwords_path
    else
      flash.now[:danger] = 'Email address not found'
    end
  end

  def edit
    @user = User.find_by_reset_password_token(params[:id])
  end

  def update
    @user = User.find_by_reset_password_token(params[:id])
    if params[:user][:password] == params[:user][:password_confirm]
      @user.update_attributes(user_params)
      redirect_to login_path
    else
      flash[:danger] = 'Invalid password_confirm'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirm)
  end
end

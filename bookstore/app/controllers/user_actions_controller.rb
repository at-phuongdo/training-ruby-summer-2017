class UserActionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    # @user.save
    # binding.pry
    if @user.save
      @user.send_activation_email
      redirect_to confirmations_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :user_name, :password)
  end
end

class UsersController < ApplicationController
  def index
    @page = (User.all.count - 1) / 10 + 1
    if params[:page].present? == false
      redirect_to users_path(page: 1)
    else
      # page = params[:page].present? ? params[:page] : 1
      # page = params[:page].to_i>0 ? params[:page] : 1
      @users = User.all.limit(10).offset((params[:page].to_i - 1) * 10)
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update; end

  def destroy; end

  def register
    @user = User.new
    render :register
  end

  def register_action
    @user = User.new(user_params)
    # @user.save
    # binding.pry

    if @user.save
      redirect_to users_path
    else
      render :register
    end
  end

  def login; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_name, :password, :image, :birthday)
  end
end

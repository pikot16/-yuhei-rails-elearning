class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    # @users = User.paginate(page: params[:page])
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Signed Up"
      redirect_to root_url
    else
      render "home/top"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated profile."
      redirect_to @user #user_path(@user) #user必要？
    else
      render 'edit'
    end
  end  
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :agreement)
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please Log In"
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end  

  def require_login
    unless logged_in?
      flash[:info] = "Please login to gain access."
      redirect_to login_url
    end
  end  

end


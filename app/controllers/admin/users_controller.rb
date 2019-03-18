class Admin::UsersController < AdminController
  before_action :logged_in_user, only: [:index, :update] # adminユーザーかどうかの判断も必要?
  # before_action :correct_user, only: [:edit, :update] これ書いたままで Set As Adminをすると何も起きずにTopに戻ってしまう。

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def update
    @user = User.find(params[:id])
    if @user.admin?
      @user.update(admin: false)
    else
      @user.update(admin: true)
    end
    redirect_to admin_users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :agreement)
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please Log In"
      redirect_to root_url
    end
  end

  def require_login
    unless logged_in?
      flash[:info] = "Please Log In"
      redirect_to root_url
    end
  end  

end

class SessionsController < ApplicationController

  def show
    @user = User.find(session[:user_id])
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Successfully Logged In"
      redirect_to "/dashboard"
    else
      # エラーメッセージを作成する
      flash[:danger] = 'Invalid email/password combination'
      # render 'home/top' にするとhomeコントローラーのtopあくしょんを経由しないため、@userがemptyでエラーになる。
      redirect_to root_url
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end

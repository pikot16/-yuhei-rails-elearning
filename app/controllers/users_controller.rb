class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Successfully Signed Up"
            redirect_to root_url
        else
            render "home/top"
        end
    end
  
    private
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation, :agreement)
    end

end


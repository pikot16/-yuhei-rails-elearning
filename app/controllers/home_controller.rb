class HomeController < ApplicationController
    def top
        @user = User.new
    end
  
    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #         flash[:success] = "Successfully Signed Up"
    #         redirect_to root_url
    #     else
    #         render "home/top"
    #     end
    # end
end

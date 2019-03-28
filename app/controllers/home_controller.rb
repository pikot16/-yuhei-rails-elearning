class HomeController < ApplicationController
  
  def top
    @user = User.new
  end

  def dashboard
    @lessons = Lesson.where(user_id: current_user.id)
    @activities = Activity.where(user_id: current_user.id).or(Activity.where(user_id: current_user.active_relationships.collect{|n| n.followed_id})).order(id: "DESC")
  end
end

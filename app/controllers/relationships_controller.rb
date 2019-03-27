class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    relationship = Relationship.find_by(followed_id: @user.id, follower_id: current_user.id)
    # relationship = current_user.active_relationships.find_by(followed_id: @user.id) is also OK
    relationship.create_activity(user_id: current_user.id)
    redirect_to request.referer # ページ遷移させないため（ページ上部には戻ってしまう）
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to request.referer
  end
end
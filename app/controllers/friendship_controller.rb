class FriendshipController < ApplicationController
  def create
    user = User.find(params[:id])
    #Check for friend request via email in exploration
    #Place conditional here when adding email functionality
    # For now, assuming we can send request to user and they are auto your friend
    friend = User.find_by(email: params[:email])
    if friend == nil
      flash[:error] = "Person does not exist!"
      redirect_to "/users/#{user.id}/dashboard"
    end
    Friendship.create!(user_id: user.id, friend_id: friend.id)
    redirect_to "/users/#{user.id}/dashboard"
  end
end
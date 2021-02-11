class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:id])
    # Check for friend request via email in exploration
    # Place conditional here when adding email functionality
    # For now, assuming we can send request to user and they are auto your friend
    friend = User.find_by(email: params[:email])

    if user.friends.include?(friend)
      flash[:error] = 'Friend already exists'
    elsif friend.nil?
      flash[:error] = 'Person does not exist!'
    elsif friend.email == user.email
      flash[:error] = "You cannot add yourself as a friend!"
    else
      Friendship.create_reciprocal_for_ids(user.id, friend.id)
    end
    redirect_to dashboard_path(user)
  end
end

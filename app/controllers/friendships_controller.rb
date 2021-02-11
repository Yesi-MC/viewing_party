class FriendshipsController < ApplicationController
  def create
     if User.exists?(email: params[:email])
       friend = User.find_by(email: params[:email])
       friendship(current_user.id, friend)
     else
       flash[:notice] = 'Person does not exist!'
     end
     redirect_to dashboard_path(current_user)
   end

   private

   def friendship(user_id, friend)
     if friend.id == user_id
       flash[:notice] = 'You cannot add yourself as a friend'
     elsif current_user.friends.include?(friend)
       flash[:notice] = 'Friend already exists'
     else
       Friendship.create!(user_id: user_id, friend_id: friend.id)
       flash[:notice] = "You are now friends with #{friend.email}"
     end
   end
 end

class FriendshipsController < ApplicationController
  before_action :require_login

  def index
    @friendships = Friendship.includes(:friend).where(user_id: current_user.id)
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)

    if @friendship.save
      flash[:notice] = 'Added friend.'
      redirect_to friendships_path
    else
      flash[:notice] = 'Unable to add friend.'
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    @friendship.destroy
    flash[:success] = 'Friend has been removed from your friends'
    redirect_to friendships_path
  end

  private

  def friendship_params
    # why not namespaced
    params.permit(:friend_id)
  end
end

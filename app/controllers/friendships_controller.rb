class FriendshipsController < ApplicationController
  before_action :require_login

  def index
    @friendships = Friendship.all
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)

    if @friendship.save
      flash[:notice] = 'Added friend.'
      redirect_to root_url
    else
      flash[:notice] = 'Unable to add friend.'
      redirect_to root_url
    end
  end

  def destroy
  end

  private

  def friendship_params
    # why not namespaced
    params.permit(:friend_id)
  end
end

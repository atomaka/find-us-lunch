class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:id)
  end
end

class FriendshipsController < ApplicationController
  before_action :require_login
  before_action :set_friendship, only: [:show, :destroy]

  def index
    @friendships = Friendship.all
  end

  def show
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html {
          redirect_to @friendship,
              notice: 'Friendship was successfully created.'
        }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json {
          render json: @friendship.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html {
        redirect_to friendships_url,
            notice: 'Friendship was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params[:friendship]
    end
end

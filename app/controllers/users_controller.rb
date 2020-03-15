class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @users = User.all
  end


  def show
    @user  = User.find params[:id]
  end

  def follow
    @follower = Follower.new(follower_id: params[:follower_id], following_id: params[:following_id])
    if @follower.save
      redirect_to user_path(params[:following_id])
    end
  end

  def unfollow
    @follower = Follower.find_by(follower_id: params[:follower_id], following_id: params[:following_id])
    if @follower.destroy
      redirect_to user_path(params[:following_id])  
    end
  end

  def followers
    @user = User.find_by(id: params[:user_id])
    @followers = @user.followers
  end

  def followings
    @user = User.find_by(id: params[:user_id])
    @followings = @user.followings
  end

end

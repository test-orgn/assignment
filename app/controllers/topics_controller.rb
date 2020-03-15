class TopicsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find params[:id]
  end

  def update
    @topic = Topic.find params[:id]
    @topic.update(topic_params)
    redirect_to topics_path
  end

  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def follow
    TopicFollower.create(user_id: params[:user_id], topic_id: params[:topic_id])
    redirect_to topics_path
  end

  def unfollow
    TopicFollower.find_by(user_id: params[:user_id], topic_id: params[:topic_id]).destroy
    redirect_to topics_path

  end
  private

  def topic_params
    params.require(:topic).permit(:name, :user_id)
  end
end

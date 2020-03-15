class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find params[:id]
  end

  def show 
    @question = Question.find params[:id]    
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def update
    @question = Question.find params[:id]
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:question, :user_id)
  end
end

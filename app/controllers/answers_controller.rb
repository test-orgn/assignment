class AnswersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
  end

  def edit
  end

  def index
  end


  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      if params[:answer][:from] == 'view'
        redirect_to @answer.question
      else
        redirect_to questions_path
      end
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to params[:from] == 'view' ? question_path(@question) : questions_path
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to @question
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end

class Admin::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :destroy]
  
  def index
    @questions = Question.all
  end

  def show
  end
  
  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: '投稿が削除されました。'
  end
  
  private
  
  def set_question
    @question = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:customer_id, :title, :body, :question_image)
  end
end

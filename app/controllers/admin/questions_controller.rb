class Admin::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :destroy]
  before_action :is_matching_login_admin, only: [:index, :show, :edit, :update]

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: '投稿が削除されました。'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def is_matching_login_admin
    unless current_admin
      redirect_to root_path
    end
  end

  def question_params
    params.require(:question).permit(:customer_id, :title, :body, :question_image)
  end
end

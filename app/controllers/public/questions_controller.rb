class Public::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      render :new
    end
  end
  
  def index
    @questions = Question.all
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @question.update(question_params)
      redirect_to @question, notice: '投稿が更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    redirect_to questions_path(@question.id), notice: '投稿が削除されました。'
  end
  
  private
  
  def set_question
    @question = Question.find(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:customer_id, :title, :body, :image)
  end
end

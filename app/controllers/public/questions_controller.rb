class Public::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :resolve]

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
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @answer = Answer.new
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

  def resolve
    if @question.update(is_active: true)
      redirect_to @question, notice: '質問が解決済みとしてマークされました。'
    else
      redirect_to @question, alert: '質問を解決済みにすることができませんでした。'
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:customer_id, :title, :content, :is_active, :question_image, :category)
  end
end

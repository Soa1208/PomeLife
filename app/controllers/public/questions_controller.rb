class Public::QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end
  
  private
  def question_params
    params.require(:question).permit(:customer_id, :title, :body, :question_image)
  end
end

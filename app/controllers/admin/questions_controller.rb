class Admin::QuestionsController < ApplicationController
  def index
  end

  def show
  end
  
  private
  def question_params
    params.require(:question).permit(:customer_id, :title, :body, :question_image)
  end
end

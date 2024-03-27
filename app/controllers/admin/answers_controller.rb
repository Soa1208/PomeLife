class Admin::AnswersController < ApplicationController
    
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to admin_question_path(params[:question_id])
  end
  
  private
  def answer_params
    params.require(:answer).permit(:customer_id, :questinon_id, :answer)
  end
  
end

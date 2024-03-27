class Public::AnswersController < ApplicationController
  
  def create
    question = Question.find(params[:question_id])
    if current_customer
      answer = current_customer.answers.new(answer_params)
      answer.question_id = question.id
      answer.save
      redirect_to question_path(question)
    else
      redirect_to customer_session_path
    end
  end
  
  def destroy
    answer = Answer.find(params[:id])
    question_id = answer.question_id
    answer.destroy
    redirect_to question_path(question_id)
  end
  
  private
  def answer_params
    params.require(:answer).permit(:customer_id, :questinon_id, :answer)
  end
end

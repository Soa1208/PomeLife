class Public::AnswersController < ApplicationController
  private
  def answer_params
    params.require(:answer).permit(:customer_id, :questinon_id, :answer)
  end
end

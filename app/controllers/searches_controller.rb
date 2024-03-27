class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    if @model == 'customer'
      @customers = Customer.search_for(@content)
    elsif @model == 'pet'
      @pets = Pet.search_for(@content)
    elsif @model == 'post'
      @posts = Post.search_for(@content)
    elsif @model == 'question'
      @questions = Question.search_for(@content)
    end
  end
end
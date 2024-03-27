class TagsearchesController < ApplicationController
  def tagsearch
    @content = params[:content]
    @questions = Question.tag_search_for(@content)
  end
end

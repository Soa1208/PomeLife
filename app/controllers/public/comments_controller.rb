class Public::CommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    if current_customer
      comment = current_customer.comments.new(comment_params)
      comment.post_id = post.id
      comment.save
      redirect_to post_path(post)
    else
      redirect_to customer_session_path
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :customer_id, :post_id)
  end
end

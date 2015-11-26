class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new
    if @comment.update_attributes comment_params
      flash[:success] = "Comment ok!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to root_url
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:user_id, :entry_id, :content)
    end
end

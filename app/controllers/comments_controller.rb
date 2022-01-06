class CommentsController < ApplicationController
  # create comment
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  # delete comment
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  # only accept certain parameters
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

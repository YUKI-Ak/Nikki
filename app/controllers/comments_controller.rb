class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :destroy]

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path, notice: "コメントは正常に削除されました。"

  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id)
    end

    def set_comment
      @article = Article.find(params[:article_id])
    end
end

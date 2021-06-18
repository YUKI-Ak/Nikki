class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    unless current_user.id == @article.user.id || current_user.id == @comment.user.id
      redirect_to root_path
    end

    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@article), notice: "コメントは正常に削除されました。"
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      render article_path(@article)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: current_user.id)
    end

    def set_article
      @article = Article.find(params[:article_id])
    end
  end
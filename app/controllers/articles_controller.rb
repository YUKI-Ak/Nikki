class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :redirect_index, only: [:edit, :update, :destroy]


  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @article.comments
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice: "削除が完了しました"
    else
      render :show, alert: "削除が失敗しました"
    end
  end



  private
  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def redirect_index
    unless current_user.id == @article.user.id
      redirect_to root_path
    end
  end

end

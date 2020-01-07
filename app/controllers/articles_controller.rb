class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save?
      #do nothing
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title,:content,:user_id)
  end
end

class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)


  def show
    @article = Article.find(params[:id])
  end
end

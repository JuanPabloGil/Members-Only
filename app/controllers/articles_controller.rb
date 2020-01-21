# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :require_logged_in

  def new
    @article = Article.new
    @user = User.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id if logged_in?

    if @article.save

      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @article = Article.all
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

  def require_logged_in
    return if logged_in?

    flash[:danger] = 'You must be logged in to make a post'
    redirect_to login_path
  end
end

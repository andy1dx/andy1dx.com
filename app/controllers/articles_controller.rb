class ArticlesController < ApplicationController
  def index
  	@articles = Article.where(status: 1).order(publish_date: 'DESC').page(params[:page]).per(30)
  end

  def show
  	@article = Article.find(params[:id])
  end
end

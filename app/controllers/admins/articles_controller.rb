class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @articles = Article.where(status: 1).order('sort_order IS NULL').order(sort_order: 'ASC', id: 'ASC') 
  end

  def new
  	@article = Article.new()
  end

  def create
    @article = Article.new(article_params)
    if @article.save() #save data 
      redirect_to admins_articles_path
    else
      render 'new' #if failed render new to disply errror
    end
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params) #save data 
      redirect_to admins_articles_path
    else
      render 'new' #if failed render new to disply errror
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if(@article.update(:status => 0))
      redirect_to admins_articles_path
    else
      redirect_to admins_articles_path
    end 
  end

  private

  def article_params
  	params.require(:article).permit(:title, :body, :category_id, :image_header, :image_article, :sort_order, :publish_date).merge(status: 1)
  end
end

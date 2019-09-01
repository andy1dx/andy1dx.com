class CategoriesController < ApplicationController
  def show
  	@articles = Article.where(status: 1, category_id: params[:id]).order(publish_date: 'DESC').page(params[:page]).per(30)
  end
end

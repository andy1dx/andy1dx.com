class HomeController < ApplicationController
  def index
  	@banners = Banner.where(status: 1).order('sort_order IS NULL').order(sort_order: 'ASC', id: 'ASC').limit(4)
  	@articles = Article.where(status: 1).order(publish_date: 'DESC').page(params[:page]).per(15)
  end
end

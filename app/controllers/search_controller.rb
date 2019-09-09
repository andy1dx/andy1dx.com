class SearchController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
  	@keyword = params[:keyword]
  	@articles = Article.where(status: 1).where("title like '%#{@keyword}%'").order(publish_date: 'DESC').page(params[:page]).per(15)
  end
end

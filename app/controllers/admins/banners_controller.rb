class Admins::BannersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @banners = Banner.where(status: 1).order('sort_order IS NULL').order(sort_order: 'ASC', id: 'ASC') 
  end

  def new
  	@banner = Banner.new()
  end
 
  def create
    @banner = Banner.new(banner_params)
    if @banner.save() #save data 
      redirect_to admins_banners_path
    else
      render 'new' #if failed render new to disply errror
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update(banner_params) #save data 
      redirect_to admins_banners_path
    else
      render 'edit' #if failed render new to disply errror
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    if(@banner.update(:status => 0))
      redirect_to admins_banners_path
    else
      redirect_to admins_banners_path
    end 
  end

  private

  def banner_params
  	params.require(:banner).permit(:title, :url, :use_url, :article_id, :category_id, :image_banner, :image_alt, :sort_order).merge(status: 1)
  end
end

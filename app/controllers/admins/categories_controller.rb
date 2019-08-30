class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save() #save data 
      redirect_to admins_banners_path
    else
      render 'new' #if failed render new to disply errror
    end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update(category_params)
  	  redirect_to admins_categories_path
  	else
  	   render 'edit' 
  	end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_path
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end
end

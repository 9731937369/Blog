class CategoriesController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show]
	def index
		@categories = Category.all
		@category = Category.new
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(category_params)
		if @category.save
			respond_to do |format|
				format.html {redirect_to categories_path}
				format.js
			end
		else
			render action: "new"
		end
	end
	def show
		@category = Category.find_by(slug: params[:id])
		@articles = Article.where('category_id = ?',@category.id)
	end
	def edit 
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find_by(slug: params[:id])
		if @category.update_attributes (category_params)
			redirect_to categories_path(@category.id)
		else
			render action: "edit"
		end		
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
			respond_to do |format|
				format.html {redirect_to categories_path, notice: "Category Deleted successfully"}
				format.js
			end
	end
	private 

	def category_params
		params[:category].permit(:name, :description)
	end
end

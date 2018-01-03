class ArticlesController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show]
	def index
		@articles = Article.all
		@article = Article.new
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		if @article.save
			respond_to do |format|
				format.html {redirect_to articles_path}
				format.js
			end
		else
			render action: "new"
		end
	end

	def my_articles
		@articles = current_user.articles
	end

	def show
		@article = Article.find_by(slug: params[:id])

		#@article = Article.find(params[:id])
		@category = Category.find(@article.category_id)
		#@article = Article.friendly.find(params[:id])
		@comment = Comment.new
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find_by(slug: params[:id])
		
		if @article.update_attributes(article_params)
			redirect_to articles_path(@article.id)
		else
			render action: "edit"
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path		
	end
	private
	def article_params
		params[:article].permit(:title, :body, :category_id, :publish_date, :feature_image_url, :is_published)
	end
end

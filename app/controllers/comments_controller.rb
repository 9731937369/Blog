class CommentsController < ApplicationController
	 before_action :authenticate_user!
	def create
		@comment = Comment.new(comment_params)
		#binding.pry
		@comment.user_id = current_user.id
		#binding.pry
		if @comment.save
			respond_to do |format|
				format.html {redirect_to article_path(@comment.article), notice:"Your comment has been added."}
				format.js
			end
		end
	end
	def my_comments
		@comments = current_user.comments
	end
	def edit
		@comment = Comment.find(params[:id])
	end
	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes (comment_params)
			redirect_to article_path(@comment.article)
		end
	end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.html {redirect_to articles_path, notice: "Comment Deleted successfully"}
			format.js
		end
	end

	private

	def comment_params
		params[:comment].permit(:title, :description, :article_id, :user_id)
	end

end



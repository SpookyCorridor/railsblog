class CommentsController < ApplicationController
	
	#require authentication only for destroy method 
	
	http_basic_authetnicate_with name: "dhh", password: "secret",
	only: :destroy 

	def create
		@article = Article.find(params[:article_id])
		# This will automatically link the comment so that it 
		# belongs to that particular article.
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end 

	def destroy
		# The destroy action will find the article we are looking at, 
		# locate the comment within the @article.comments collection, 
		# and then remove it 

		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end 

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end 
end

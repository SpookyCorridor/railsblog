class ArticlesController < ApplicationController
	
	def index
		@articles = Article.all 
	end 

	def show 
		@article = Article.find(params[:id])
	end 

	def new
		@article = Article.new 
	end 	

	def create 
		@article = Article.new(article_params) 
		if @article.save
			redirect_to @article 
		else 
			render 'new'
			# The render method is used so that the @article object is
			# passed back to the new template when it is rendered. This 
			# rendering is done within the same request as the form
			# submission, whereas the redirect_to will tell the browser 
			# to issue another request.
		end 
	end 

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end 
end

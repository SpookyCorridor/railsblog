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

	def edit 
		@article = Article.find(params[:id])
	end 

	def create 
		@article = Article.new(article_params) 
		if @article.save
			redirect_to @article 
		else 
			render 'new'
			# The render method is used so that the @article object is
			# passed back to the new template when rendered. This 
			# rendering is done within the same request as the form
			# submission, whereas redirect_to will tell the browser 
			# to issue another request.
		end 
	end 

	def update 
		@article = Article.find(params[:id])

		# You don't need to pass all attributes to update.
		# if you'd call @article.update(title: 'A new title') Rails 
		# would only update the title attribute

		if @article.update(article_params)
			redirect_to @article 
		else 
			render 'edit'
		end 
	end 

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end 

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end 
end

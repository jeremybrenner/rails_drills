class ArticlesController < ApplicationController

	before_action :logged_in?
	before_action :find_user_article, only: [:edit, :show, :destroy]

	def new
		@article = Article.new
	end

	def create
		article = current_user.articles.create(article_params)
		redirect_to article_path article
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit 
		@article = Article.find(params[:id])
		render :edit
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		redirect_to article_path @article
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to user_path(current_user.id)
	end

	private 
	def article_params
		params.require(:article).permit(:id, :title, :content)
	end

	def find_user_article
		@article = current_user.articles.find_by({id: params[:id]})
		unless @article
        redirect_to "/users/#{current_user.id}"
      end
    end 

end

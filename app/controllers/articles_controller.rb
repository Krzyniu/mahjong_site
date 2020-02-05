class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end
    
    def new
        if signed_in?
            restrict_access if current_user.is_admin != true 
            @article = Article.new
        else 
            restrict_access
        end
    end

    def edit
        if signed_in?
            restrict_access if current_user.is_admin != true 
            @article = Article.find(params[:id])
        else 
            restrict_access
        end
    end

    def create
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to articles_path 
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        if signed_in?
            restrict_access if current_user.is_admin != true 
            @article = Article.find(params[:id])
            @article.destroy
            redirect_to articles_path
        else 
            restrict_access
        end
    end

    def restrict_access
        redirect_to root_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text, :image)
        end
end
class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        #render plain: params[:article].inspect
        #@article = Article.new(params[:article])
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
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

    def show
        @articles = Article.all
    end
   
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
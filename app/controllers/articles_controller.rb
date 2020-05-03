class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "carlos", 
       password: "secret", except: [:index, :show]

    def new 
      @article = Article.new
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
 
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
    
    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
 
        # @article.save
        # redirect_to @article
        
 
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
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

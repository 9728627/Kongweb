class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    #@article.save
    if @article.save
      flash[:notice] = "Article was successfully posted"
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Post was successfully updated"
      redirect_to article_path(@article)
    else
      reder 'edit'
    end
  end

  #define index
  def index
    @articles = Article.all
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

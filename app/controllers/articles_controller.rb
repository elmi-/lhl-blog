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
    # below is used to render json of form fields (params[:article] contains the attributes we're interested in), neat!
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end

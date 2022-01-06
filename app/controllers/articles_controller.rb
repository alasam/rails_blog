class ArticlesController < ApplicationController
  # index page
  def index
    @articles = Article.all
  end

  # show page (list of forms created)
  def show
    @article = Article.find(params[:id])
  end

  # new page (shows title and post)
  def new
    @article = Article.new
  end

  # edit
  def edit
    @article = Article.find(params[:id])
  end

  # creating/saving new post
  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
   
  # submitting update
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # delete entry
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  #only accepting certain entries
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

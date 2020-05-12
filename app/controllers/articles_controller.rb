class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all # list of all available articles
  end

  def new
    @article = Article.new # sets the article instance variable
  end

  def create
    @article = Article.new(article_params_whitelist)

    if @article.save # attempt to save article
      flash[:notice]= "Your article was successfully saved."
      redirect_to article_path(@article) # instance of article gets passed into the view
    else
      flash[:notice]= "Sorry there was an error saving this article."
      render 'new' # if errors render new article route again
    end

  end
  
  def show
    @article = Article.find(params[:id]) # find article to show by article:id accessed via url_params
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params_whitelist) # attempt to update article
      flash[:notice]= "Your article was successfully updated."
      redirect_to article_path(@article) # instance of article gets passed into the view
    else
      flash[:notice]= "Sorry there was an error updating this article."
      render 'edit' # if errors render new article route again
    end
  end

  private
    def article_params_whitelist
      #requires the article, and permits the values we're expecting for it from the form
      params.require(:article).permit(:title, :description) 
    end
end
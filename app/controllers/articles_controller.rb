class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy] #runs before each defined action

  def index
    # list of all available articles
    # @articles = Article.paginate(page: params[:page]) # paginate articles to default # of articles per page
    @articles = Article.paginate(page: params[:page], per_page: 1) # paginate articles to 5 per page.
  end

  def new
    @article = Article.new # sets the article instance variable
  end

  def create
    @article = Article.new(article_params_whitelist)
    
    @article.user = User.first # ensures that each article has a user associated.

    if @article.save # attempt to save article
      flash[:success]= "Your article was successfully saved."
      redirect_to article_path(@article) # instance of article gets passed into the view
    else
      flash[:warning]= "Sorry there was an error saving this article."
      render 'new' # if errors render new article route again
    end

  end
  
  def show
    # @article = Article.find(params[:id])
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params_whitelist) # attempt to update article
      flash[:success]= "Your article was successfully updated."
      redirect_to article_path(@article) # instance of article gets passed into the view
    else
      flash[:warning]= "Sorry there was an error updating this article."
      render 'edit' # if errors render new article route again
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article #{params[:id]} has been deleted."
    redirect_to articles_path
  end

  private
    def set_article # this method will get called before each action
      @article = Article.find(params[:id])
    end
    def article_params_whitelist
      #requires the article, and permits the values we're expecting for it from the form
      params.require(:article).permit(:title, :description) 
    end
end
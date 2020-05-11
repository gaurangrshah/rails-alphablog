class ArticlesController < ApplicationController
  
  def new
    @article = Article.new # sets the article instance variable
  end

  def create
    @article = Article.new(article_params_whitelist)
    @article.save
    redirect_to_articles_show(@article) # instance of article gets passed into the view
  end

  private
    def article_params_whitelist
      #requires the article, and permits the values we're expecting for it from the form
      params.require(:article).permit(:title, :description) 
    end
end
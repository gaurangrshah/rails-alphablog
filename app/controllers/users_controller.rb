class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # user_params are whitelisted params our form accpects.
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      flash[:warning] = "Sorry there was an issue saving thisuser"
      render 'new' #renders new user template if any errors occur
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User #{params[:id]} updated"
      redirect_to articles_path
    else
      flash[:warning] = "Sorry there was an issue updateed user: #{@user.id}"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
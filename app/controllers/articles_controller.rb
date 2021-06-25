class ArticlesController < ApplicationController

  before_action :logged_in_user

  def home
  end

  def new
    @article = current_user.articles.new
  end
  
  def index
    @articles = Article.all.select {|a| a.status == 'public'}

  end

  def user_index
    @articles = Article.all
    @articles = @articles.select { |a| a.user_id == @current_user.id }
    render 'user_index'
  end
    
  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:success] = 'Article has been created!'
      redirect_to @article
    else
      render :new 
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      flash[:success] = 'Article updated'
      redirect_to @article
    else
      render :edit
    end
  end
  
  def destroy
    @article = current_user.articles.find(params[:id])
    if @article
      @article.destroy
      flash[:success] = 'Article has been deleted'
    else
      flash[:alert] = 'Error'
    end
    redirect_to root_path
  end

  def show
    begin
      @article = Article.find(params[:id]) #Instance variable
      if (@article.user_id == @current_user.id)
        @article
      else
        @visitor = true
      end
    rescue
      flash[:alert] = 'This article doesn\'t exist.'
      redirect_to articles_path
    end
  end

  def toggle_follow
    toggle = params[:toggle_follow]
    if Follower.exists?(user_id: toggle[:current_user], following: toggle[:author])
      follow = Follower.where(user_id: toggle[:current_user], following: toggle[:author])
      follow = follow.first # first element, bc .where returns an array(in this case of just one element)
      Follower.destroy(follow.id)
    else
      follow = Follower.new(user_id: toggle[:current_user], following: toggle[:author])
      follow.save
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end

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
    # if current_user?(params[:id].to_i)
    @articles = Article.all
    @articles = @articles.select { |a| a.user_id == @current_user.id }
    render 'user_index'
    # else
    #   redirect_to "/user/#{ current_user.id }"
    # end

  end
    
  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:success] = 'Article haas been created!'
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
    @article = Article.find(params[:id]) #Instance variable
    puts "ID DEL USER #{ @current_user.id} ID del ARTICULO #{ @article.user_id}"
    puts "ART de #{@article.title}, loggeado #{@current_user.id.class}" 
    puts "Iguales? #{@article.user_id == @current_user.id}"
    if (@article.user_id == @current_user.id)
      @article
    else
      @visitor = true
    end
  end

 

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end

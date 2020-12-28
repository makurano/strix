class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :prevent_edit, only: [:edit, :update, :destroy]
  

  def index
    @articles = Article.includes(:user).with_attached_article_file
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      @article.article_file.purge
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :title_en, :journal_name, :abstract, :category_id,
                                    :article_file).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def prevent_edit
    redirect_to action: :index unless current_user.id == @article.user_id
  end

end

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.includes(:user).with_attached_article_file
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
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

  private

  def article_params
    params.require(:article).permit(:title, :title_en, :journal_name, :abstract, :category_id,
                                    :article_file).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

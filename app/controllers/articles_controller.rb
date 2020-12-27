class ArticlesController < ApplicationController
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
      render new_article_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :title_en, :journal_name, :abstract, :category_id,
                                    :article_file).merge(user_id: current_user.id)
  end
end

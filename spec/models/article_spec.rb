require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事情報登録' do
    context '記事が登録できるとき' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@article).to be_valid
      end
      it 'title_enが空でも登録できる' do
        @article.title_en = ''
        expect(@article).to be_valid
      end
      it 'journal_nameが空でも登録できる' do
        @article.journal_name = ''
        expect(@article).to be_valid
      end
      it 'publication_dateが空でも登録できる' do
        @article.publication_date = ''
        expect(@article).to be_valid
      end
      it 'abstractが空でも登録できる' do
        @article.abstract = ''
        expect(@article).to be_valid
      end
      it 'article_fileが空でも登録できる' do
        @article.article_file = nil
        expect(@article).to be_valid
      end
    end

    context '記事が登録できないとき' do
      # titleに関するテスト
      it 'titleが空だと登録できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      # category_idに関するテスト
      it 'category_idが0だと登録できない' do
        @article.category_id = 0
        @article.valid?
        expect(@article.errors.full_messages).to include('Category select')
      end
      it 'category_idが空だと登録できない' do
        @article.category_id = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Category can't be blank", 'Category select')
      end
      # article_fileに関するテスト
      it 'article_fileが4MBを超えると保存できない' do
          @article.article_file.blob.byte_size = 5.megabytes
          @article.valid?
          expect(@article.errors.full_messages).to include("Article file can't save if the file is more than 4mb")
      end
    end
  end
end

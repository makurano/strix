class Article < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :article_file

  with_options presence: true do
    validates :title
    validates :category_id, numericality: { other_than: 0, message: 'select' }
  end

  def self.search(search)
    if search != ""
      Article.eager_load(:user).where( 'title LIKE(?) OR title_en LIKE(?) OR journal_name LIKE(?) OR last_name LIKE(?) OR first_name LIKE(?) OR last_name_en LIKE(?) OR first_name_en LIKE(?)' ,
                                                                                              "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%" )
    else
      Article.includes(:user)
    end
  end

  private
  def in_where
    
  end
end

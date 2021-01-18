class Article < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :article_file

  with_options presence: true do
    validates :title
    validates :category_id, numericality: { other_than: 0, message: 'select' }
  end

  validate :file_size
  def file_size
    if article_file.present?
      if article_file.blob.byte_size > 4.megabytes
        errors.add(:article_file, "can't save if the file is more than 4mb")
      end
    end
  end

  def self.search(search)
    if search != ''
      query_str = 'title LIKE(?) OR title_en LIKE(?) OR journal_name LIKE(?) OR last_name LIKE(?) OR first_name LIKE(?) OR last_name_en LIKE(?) OR first_name_en LIKE(?) 
                    OR concat(last_name, first_name) LIKE(?) OR concat(first_name_en, last_name_en) LIKE(?)'
      Article.eager_load(:user).where(query_str,
                                      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Article.includes(:user)
    end
  end

end

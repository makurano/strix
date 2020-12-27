class Article < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :article_file, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :category_id, numericality: { ohter_than: 0, message: 'select'}
  end
end

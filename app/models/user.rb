class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  with_options presence: true do
    # 全角での入力「あ〜漢字」正規表現
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } do
      validates :last_name
      validates :first_name
    end
    # 英語表記（頭文字が大文字）の正規表現
    with_options format: { with: /\A[A-Z][a-z]*\Z/, message: 'is invalid. Input english(uppercase is letters)' } do
      validates :last_name_en
      validates :first_name_en
    end
    validates :birthday
  end

  has_many         :articles
  has_one_attached :image
end

class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image, dependent: :destroy
end

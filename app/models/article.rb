class Article < ApplicationRecord
  mount_uploader :image_header, ImageHeaderUploader
  mount_uploader :image_article, ImageArticleUploader
  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
  validates :publish_date, presence: true
  validates_presence_of :image_header
  validates_presence_of :image_article
  belongs_to :category
  has_many :banners, dependent: :restrict_with_error
end

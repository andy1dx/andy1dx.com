class Banner < ApplicationRecord
  mount_uploader :image_banner, ImageBannerUploader
  validates :title, presence: true
  validates :category_id, presence: true
  validates_presence_of :image_banner

end

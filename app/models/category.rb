class Category < ApplicationRecord
  validates :name, presence: true
  has_many :articles, dependent: :restrict_with_error
  has_many :banners, dependent: :restrict_with_error
end

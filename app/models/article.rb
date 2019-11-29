class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reactions
  has_many :reviews
  has_rich_text :content
  mount_uploader :photo, PhotoUploader

  validates :title, :content, presence: true
end

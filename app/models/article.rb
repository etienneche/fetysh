class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reactions
  has_many :reviews

  validates :title, :content, presence: true
end

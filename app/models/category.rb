class Category < ApplicationRecord
  has_many :articles
  has_many :user_categories

  validates :name, presence: true
  has_many :reactions, through: :articles
end

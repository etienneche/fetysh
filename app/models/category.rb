class Category < ApplicationRecord
  has_many :articles
  has_many :subcategories

  validates :name, presence: true
end

class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :user_categories

  validates :name, presence: true
end

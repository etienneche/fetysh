class Article < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :title

  PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true, :dictionary => "english"} } }

  belongs_to :category
  belongs_to :user
  has_many :reactions
  has_many :reviews
  mount_uploader :photo, PhotoUploader

  validates :title, :content, presence: true
end

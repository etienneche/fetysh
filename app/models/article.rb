class Article < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :title

  PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true, :dictionary => "english"} } }

  belongs_to :category
  belongs_to :user
  has_many :reactions
  has_many :reviews
  mount_uploader :photo, PhotoUploader
  attribute :photo, :string, default: 'https://images.unsplash.com/photo-1518208940245-41bdd9dab228?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=871&q=80'

  validates :title, :content, presence: true
end

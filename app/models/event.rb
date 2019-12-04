class Event < ApplicationRecord
  include PgSearch::Model
  PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true, :dictionary => "english"} } }

  multisearchable against: [:title]
  belongs_to :user
  belongs_to :category
  monetize :price_cents
  has_many :ratings
  attribute :photo, :string, default: 'https://images.unsplash.com/photo-1518208940245-41bdd9dab228?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=871&q=80'

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

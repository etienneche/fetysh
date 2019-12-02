class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  monetize :price_cents
  has_many :ratings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

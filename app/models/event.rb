class Event < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :description]
  belongs_to :user
  belongs_to :category

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

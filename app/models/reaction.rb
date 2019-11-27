class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :reaction, presence: true
end

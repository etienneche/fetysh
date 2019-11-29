class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :reaction, presence: true
  # Make sure that one user can only have one like per post or comment
  # validates :user_id, uniqueness: { scope: [:article_id, :comment_id] }
end

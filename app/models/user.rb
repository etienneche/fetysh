class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_categories
  has_many :orders
  has_many :reactions
  has_many :articles
  has_many :reviews
  has_many :ratings
  attribute :description, :text, default: 'This user has not yet provided a description.'
  attribute :photo, :string, default: 'https://api.adorable.io/avatars/285/abott@adorable.png'

  def loved?(article)
    reactions.where(article: article, reaction: 'love').any?
  end

  def wtted?(article)
    reactions.where(article: article, reaction: 'want_to_try').any?
  end
end

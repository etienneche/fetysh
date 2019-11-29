class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_categories
  has_many :reactions
  has_many :articles
  has_many :reviews

  def loved?(article)
    reactions.where(article: article, reaction: 'love').any?
  end

  def saved?(article)
    reactions.where(article: article, reaction: 'save').any?
  end

  def wtted?(article)
    reactions.where(article: article, reaction: 'wtt').any?
  end
end

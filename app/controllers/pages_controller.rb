class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @articles = Article.all
    @events = Event.all
  end

  def landing
  end
end

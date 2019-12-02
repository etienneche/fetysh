class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    if params[:query]
      # @results = PgSearch.multisearch(params[:query])
      # @articles = @results.where(searchable_type: "Article")
      # @events =  @results.where(searchable_type: "Event")

      @articles = Article.where("title ILIKE ? OR content ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
      @events =  Event.where("title ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")

    else
      @articles = Article.all
      @events = Event.all
    end
  end

  def landing
  end
end

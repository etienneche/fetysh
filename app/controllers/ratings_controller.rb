class RatingsController < ApplicationController
  before_action :set_event

  def new
    @rating = Rating.new
    @rating.event = @event
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.event = @event
    if @rating.save
      redirect_to event_path(@event)
    else
      redirect_to articles_path(@article)
      flash[:alert] = "Minimum of 10 characteres."
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:content, :stars)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end

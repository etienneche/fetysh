class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :destroy, :update]

  def index
    @events = Event.geocoded.order(date: :asc)

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def show
    @user = current_user
    @marker = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
    @ratings = Rating.where("event_id = ?", @event.id)
    @rating = Rating.new
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to events_path, notice: 'The event was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :address, :price, :photo, :description)
  end
end

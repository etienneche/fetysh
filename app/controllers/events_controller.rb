class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :destroy, :update]

  def index
    @events = Event.geocoded

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })      }
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
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
end

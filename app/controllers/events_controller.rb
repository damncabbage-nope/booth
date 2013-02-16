class EventsController < ApplicationController
  def index
    @events = events.all
  end

  def show
    @event = events.find(params[:id])
  end

  protected

    def events
      Event.active
    end
end

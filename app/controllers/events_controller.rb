class EventsController < ApplicationController
  respond_to :json, :html

  def index
    @events = events.all
    respond_with(@events)
  end

  def show
    @event = events.find(params[:id])
    respond_with(@event)
  end

  protected

    def events
      Event.active
    end
end

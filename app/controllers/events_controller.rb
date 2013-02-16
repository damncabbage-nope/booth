class EventsController < ApplicationController
  respond_to :json, :html

  def index
    @events = events.all
    respond_with(@events) do |f|
      f.html do
        if @events.count == 1
          redirect_to event_path(@events.first)
        else
          render :index
        end
      end
    end
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

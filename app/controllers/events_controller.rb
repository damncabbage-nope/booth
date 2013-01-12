class EventsController < ApplicationController
  def index
    @events = Event.all # TODO: Active events only
  end

  def show
  end
end

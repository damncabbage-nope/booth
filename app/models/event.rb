class Event < ActiveRecord::Base

  attr_accessible :name, :tagline, :description
  attr_accessible :sales_opened_at, :sales_closed_at, :began_at, :finished_at

  validates_presence_of :name, :sales_opened_at, :sales_closed_at, :began_at, :finished_at

  # TODO: Date validation, sequence of dates, ie.
  #       sales_opened_at < :sales_closed_at < :began_at < :finished_at

end

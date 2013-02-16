class Event < ActiveRecord::Base

  attr_accessible :name, :tagline, :description
  attr_accessible :sales_opened_at, :sales_closed_at, :began_at, :finished_at

  ### Validation

  validates_presence_of :name, :sales_opened_at, :sales_closed_at, :began_at, :finished_at

  # Date validation, sequence of dates, ie.
  # sales_opened_at < :sales_closed_at < :began_at < :finished_at
  validates_datetime :sales_opened_at
  validates_datetime :sales_closed_at, :after => :sales_opened_at
  validates_datetime :began_at, :after => :sales_closed_at
  validates_datetime :finished_at, :after => :began_at


  ### Scopes

  def self.active(now=Time.now)
    where('finished_at > ?', now)
  end

end

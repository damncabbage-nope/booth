require 'spec_helper'

describe DatesHelper do
  describe "#pretty_date_and_time_range" do

    it "returns one date for single-day events" do
      start  = Time.parse '2012-03-12 09:45:00 +1100'
      finish = Time.parse '2012-03-12 17:30:00 +1100'
      pretty_date_and_time_range(start, finish).should == "12 March 2012, 9:45am - 5:30pm"
    end

    it "returns a day range for multiple-day events" do
      start  = Time.parse '2012-03-12 09:45:00 +1100'
      finish = Time.parse '2012-03-12 17:30:00 +1100'
      pretty_date_and_time_range(start, finish).should match /^12 March 2012, /
    end

    it "returns a day + month range for multiple-day events that cross a month boundary" do
      start  = Time.parse '2012-03-31 09:45:00 +1100'
      finish = Time.parse '2012-04-01 17:30:00 +1100'
      pretty_date_and_time_range(start, finish).should match /^31 March - 1 April 2012, /
    end

    it "returns a date range for multiple-day events that cross a year boundary" do
      start  = Time.parse '2012-12-31 09:45:00 +1100'
      finish = Time.parse '2013-01-01 17:30:00 +1100'
      pretty_date_and_time_range(start, finish).should match /^31 December 2012 - 1 January 2013, /
    end

    # See: app/helpers/dates_helper.rb; intentional assumption for the moment.
    pending "assumes the start/finish times given are 'daily' times" do
      start  = Time.parse '2012-03-12 09:45:00 +1100'
      finish = Time.parse '2012-03-13 17:30:00 +1100'
      pretty_date_and_time_range(start, finish).should == "12 - 13 March 2012, 9:45am - 5:30pm daily"
    end

  end
end

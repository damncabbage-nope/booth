module DatesHelper

  # Pretty-prints date ranges, eg.
  # - "4 March 2012, 9:00am - 5:30pm"
  # - "4 - 5 March 2012, 9:00am - 5:30pm daily"
  #
  # NOTE: This is intentionally limited for the moment; as
  #       events happen that need different date ranges, we
  #       will adjust this.
  def pretty_date_and_time_range(start, finish)
    time_format = "%-l:%M%P" # eg. "6:35pm"
    "#{pretty_date_range(start, finish)}, #{start.strftime(time_format)} - #{finish.strftime(time_format)}"
  end

  protected

    # HACK: Hideous.
    def pretty_date_range(start, finish)
      date_format  = "%-d/%B/%Y"
      start_parts  = start.strftime(date_format).split("/")
      finish_parts = finish.strftime(date_format).split("/")

      start_diff  = []
      finish_diff = []
      common      = []

      start_parts.each_with_index do |start_part,idx|
        finish_part = finish_parts[idx]
        if start_part == finish_part
          common = start_parts[idx..-1]
          break
        end
        start_diff  << start_part
        finish_diff << finish_part
      end

      differing = [start_diff.join(" "), finish_diff.join(" ")].reject(&:empty?).join(" - ")
      [differing, common.join(" ")].reject(&:empty?).join(" ")
    end

end

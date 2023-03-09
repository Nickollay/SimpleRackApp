# frozen_string_literal: true

class TimeTeller
  YEAR = 'year'
  MONTH = 'month'
  DAY = 'day'
  HOUR = 'hour'
  MINUTE = 'minute'
  SECOND = 'second'

  TIME_UNITS = [YEAR, MONTH, DAY, HOUR, MINUTE, SECOND].freeze

  DEFAULT_FORMAT = '%Y-%m-%d %H:%M:%S'

  def call(time_units)
    tell(time_units)
  end

  private

  def tell(time_units)
    time = Time.now
    format = time_format(time_units)

    time.strftime(format)
  end

  def time_format(time_units)
    return DEFAULT_FORMAT if time_units.nil?

    year_month_day = []
    year_month_day << '%Y' if time_units.include?(YEAR)
    year_month_day << '%m' if time_units.include?(MONTH)
    year_month_day << '%d' if time_units.include?(DAY)

    hour_min_sec = []
    hour_min_sec << '%H' if time_units.include?(HOUR)
    hour_min_sec << '%M' if time_units.include?(MINUTE)
    hour_min_sec << '%S' if time_units.include?(SECOND)

    format = "#{year_month_day.join('-')} #{hour_min_sec.join(':')}".strip

    format
  end
end

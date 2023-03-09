class TimeController < BaseController
  def time
    time_units = params['format']&.delete(' ')&.split(',')
    wrong_params = unknown_params(time_units)

    if wrong_params.empty?
      self.status = 200
      self.body = TimeTeller.new.call(time_units)
    else
      unknown_time_format(wrong_params)
    end

    self
  end

  private

  def unknown_params(time_units)
    return [] if time_units.nil?
    return [] if time_units.empty?

    time_units.reject { |time_unit| required_params.include?(time_unit) }
  end

  def unknown_time_format(wrong_params)
    self.status = 400
    self.body = "Unknown time format #{wrong_params}"

    self
  end

  def required_params
    TimeTeller::TIME_UNITS
  end
end

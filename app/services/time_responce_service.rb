class TimeResponceService
  def call(params)
    time_units = params['format']&.delete(' ')&.split(',')
    wrong_params = unknown_params(time_units)

    if wrong_params.empty?
      success = true
      body = TimeTeller.new.call(time_units)
    else
      success = false

      body = unknown_time_format(wrong_params)
    end

    OpenStruct.new(success?: success, body:  body)

  end

  private

  def unknown_params(time_units)
    return [] if time_units.nil?
    return [] if time_units.empty?

    time_units.reject { |time_unit| required_params.include?(time_unit) }
  end

  def unknown_time_format(wrong_params)
    "Unknown time format [#{wrong_params.join(', ')}]"
  end

  def required_params
    TimeTeller::TIME_UNITS
  end
end

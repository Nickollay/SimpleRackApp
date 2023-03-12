class TimeController
  attr_accessor :status, :body

  def initialize(request:)
    @request = request
  end

  def time
    return not_found unless @request.get?

    result = TimeTeller.new.call(params)

    if result.success?
      self.status = 200
    else
      self.status = 400
    end

    self.body = result.body

    [status, {}, [body]]
  end

  private

  def params
    @request.params
  end

  def not_found(message = 'Not Found')
    [404, {}, [message]]
  end
end

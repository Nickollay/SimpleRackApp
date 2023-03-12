class TimeController
  attr_accessor :status, :body

  def initialize(request:)
    @request = request
  end

  def time
    result = TimeResponceService.new.call(params)

    if result.success?
      self.status = 200
    else
      self.status = 400
    end

    self.body = result.body

    self
  end

  private

  def params
    @request.params
  end
end

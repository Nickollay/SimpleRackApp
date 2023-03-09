class BaseController
  attr_accessor :status, :headers, :body

  def initialize(request:)
    @request = request
  end

  def params
    @request.params
  end
end

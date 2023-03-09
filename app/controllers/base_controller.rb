class BaseController
  attr_accessor :status, :headers, :body

  DEFAULT_CONTENT_TYPE = {'content-type' => 'text/plain'}

  def initialize(request:)
    @request = request
    @headers = DEFAULT_CONTENT_TYPE
  end

  def params
    @request.params
  end
end

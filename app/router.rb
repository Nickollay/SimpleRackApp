class Router
  def route!(request)
    if request.path == '/time' && request.get?
      result = TimeController.new(request: request).time

      [result.status, result.headers, [result.body]]
    else
      not_found
    end
  end

  private

  def not_found(message = 'Not Found')
    [404, { 'content-type' => 'text/plain' }, [message]]
  end
end

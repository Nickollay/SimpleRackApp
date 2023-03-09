app_files_regex = File.expand_path('../app/**/*.rb', __FILE__ )
Dir.glob(app_files_regex).each { |file_path| require file_path }

class SimpleRackApp
  def call(env)
    request = Rack::Request.new(env)

    handle_route(request)
  end

  private

  def handle_route(request)
    Router.new.route!(request)
  end
end

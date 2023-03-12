app_files_regex = File.expand_path('../app/**/*.rb', __FILE__ )
Dir.glob(app_files_regex).each { |file_path| require file_path }

class SimpleTimeRackApp
  def call(env)
    request = Rack::Request.new(env)

    TimeController.new(request: request).time
  end
end

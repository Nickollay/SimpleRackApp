require 'rack'
require_relative 'simple_time_rack_app.rb'
require 'pry'

ROUTES = {
  '/time' => SimpleTimeRackApp.new
}

# use Rack::Reloader, 0
use Rack::ContentType, "text/plain"
use Rack::ContentLength

run Rack::URLMap.new(ROUTES)

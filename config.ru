require 'rack'
require_relative 'simple_rack_app.rb'
require 'pry'

ROUTES = {
  '/time' => SimpleRackApp.new
}

# use Rack::Reloader, 0
use Rack::ContentType, "text/plain"
use Rack::ContentLength

run Rack::URLMap.new(ROUTES)

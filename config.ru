require 'rack'
require_relative 'simple_rack_app.rb'
require 'pry'

use Rack::Reloader, 0
run SimpleRackApp.new

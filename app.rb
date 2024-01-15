require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

require_relative "classes"
require_relative "routes"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

app = File.expand_path('../app', __FILE__)
$LOAD_PATH.unshift(app) unless $LOAD_PATH.include?(app)

require './config/env'
require './app'

run Bender::API

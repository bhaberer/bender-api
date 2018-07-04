api = File.expand_path('../api', __FILE__)
$LOAD_PATH.unshift(api) unless $LOAD_PATH.include?(api)

require 'grape'
require 'plugins/countdowns'

module Bender
  class API < Grape::API
    format :json
    prefix :api
    mount Countdowns
  end
end

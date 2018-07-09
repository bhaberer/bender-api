require 'grape'
require './api/plugins/countdowns'

module Bender
  class API < Grape::API
    format :json
    prefix :api
    mount Plugin::Countdowns
  end
end

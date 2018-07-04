require 'grape'
require_relative './plugins/countdowns'

module Bender
  class API < Grape::API
    format :json
    prefix :api
    mount Countdowns

    desc 'Countdown till Pax'
    get '/' do
      'Foo'
    end
  end
end

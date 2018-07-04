require 'grape'
require 'countdowns'

module Bender::Countdowns
  class API < Grape::API
    format :json
    prefix :api

    mount Countdowns => '/countdowns'

    desc 'Countdown till Pax'
    get '/' do
      'Foo'
    end
  end
end

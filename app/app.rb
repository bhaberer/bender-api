require 'grape'

module Bender
  class API < Grape::API
    format :json
    prefix :api

    resource :countdowns do
      desc 'Countdown till Pax'
      get :pax do
        { text: 'So many days' }
      end
    end

    desc 'Countdown till Pax'
    get '/' do
      'Foo'
    end
  end
end

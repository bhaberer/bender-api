require 'grape'

module Bender
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    resource :countdown do
      desc 'Countdown till Pax'
      get :pax do
        'Foo'
      end
    end
  end
end

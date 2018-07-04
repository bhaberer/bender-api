module Bender
  module Countdowns
    class API < Grape::API
      format :json
      prefix :api

      desc 'Countdown till Pax'
      get :pax do
        { text: 'So many days' }
      end
    end
  end
end

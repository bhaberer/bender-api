module Countdowns
  class API < Grape::API
    format :json
    prefix :countdowns

    desc 'Countdown till Pax'
    get :pax do
      { text: 'So many days' }
    end
  end
end

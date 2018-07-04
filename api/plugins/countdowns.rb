class Countdowns < Grape::API
  format :json

  resource :countdowns do
    desc 'Countdown till Pax'
    get :pax do
      { text: 'So many days' }
    end
  end

end

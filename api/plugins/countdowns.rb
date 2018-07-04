class Countdowns < Grape::API
  format :json

  desc 'Countdown till Pax'
  get :pax do
    { text: 'So many days' }
  end
end

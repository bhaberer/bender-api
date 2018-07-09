# frozen_string_literal: true

require './api/plugins/countdowns/helpers'
require 'json'
require 'grape'

module Plugin
  # Class to manage countdown api requests
  class Countdowns < Grape::API
    format :json

    resource :countdowns do
      desc 'Countdown till Pax'
      post :pax do
        next_pax = get_next_pax
        { name: next_pax.name,
          date: next_pax.date,
          estimated: next_pax.estimated,
          text: get_pax_time_string(next_pax) }
      end

      desc 'Countdown till Pax'
      get :pax do
        next_pax = get_next_pax
        { name: next_pax.name,
          date: next_pax.date,
          estimated: next_pax.estimated,
          text: get_pax_time_string(next_pax) }
      end

      build_paxes.each do |pax|
        desc "Countdown till #{pax.pax_type}"
        get "pax/#{pax.pax_type}" do
          next_pax = get_next_pax(pax_type: pax.pax_type)
          { name: next_pax.name,
            date: next_pax.date,
            estimated: next_pax.estimated,
            text: get_pax_time_string(next_pax) }
        end
      end
    end
  end
end

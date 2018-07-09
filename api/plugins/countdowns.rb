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
      get :pax do
        { text: 'So many days' }
      end

      build_paxes.each do |pax|
        desc "Countdown till #{pax.pax_type}"
        get "pax/#{pax.pax_type}" do
          next_pax = get_next_pax(pax_type: pax.pax_type)
          { text: next_pax.time_till }
        end
      end
    end
  end
end

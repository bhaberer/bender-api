# frozen_string_literal: true

require './api/plugins/countdowns/pax'
require './api/plugins/countdowns/helpers'
require 'json'
require 'grape'

PAX_FILE = 'api/plugins/countdowns/pax.json'.freeze


module Plugin
  # Class to manage countdown api requests
  class Countdowns < Grape::API
    format :json

    resource :countdowns do
      desc 'Countdown till Pax'
      get :pax do
        { text: 'So many days' }
      end

      def build_paxes
        paxes = json_file_to_hash(PAX_FILE)
        pax_list = []
        paxes.each do |pax|
          pax_list << Pax.new(pax['name'], pax['date'],
                              pax['type'], pax['estimated'])
        end
        pax_list
      end

      build_paxes.each do |pax|
        desc 'Countdown till Pax'
        get "pax/#{pax.pax_type}" do
          { text: 'So many days' }
        end
      end
    end
  end
end

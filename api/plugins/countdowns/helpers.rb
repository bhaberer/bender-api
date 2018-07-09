# frozen_string_literal: true

require './api/plugins/countdowns/pax'
require 'json'
require 'time'

PAX_FILE = 'api/plugins/countdowns/pax.json'.freeze

def json_file_to_hash(file_name)
  file = File.read(file_name)
  JSON.parse(file)
end

def build_paxes(pax_type: nil)
  paxes = json_file_to_hash(PAX_FILE)
  pax_list = []
  paxes.each do |pax|
    next if pax_type && pax_type.to_s != pax['type'].to_s
    pax_list << Pax.new(pax['name'], pax['date'],
                        pax['type'], pax['estimated'])
  end
  pax_list
end

def get_next_pax(pax_type: nil)
  paxes = build_paxes(pax_type: pax_type)
  paxes = paxes.delete_if { |pax| pax.date < Time.now }
  paxes.sort! { |a, b| a.date <=> b.date }
  paxes.first
end

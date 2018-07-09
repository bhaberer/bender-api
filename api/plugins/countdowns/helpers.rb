# frozen_string_literal: true

require './api/plugins/countdowns/pax'
require 'json'
require 'time'

PAX_FILE = 'api/plugins/countdowns/pax.json'

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

def get_pax_time_string(pax)
  return 'I don\'t have info for the next one of those PAXes' if pax.nil?
  message = ["#{pax.name} is"]
  message << 'approximately' if pax.estimated

  # Uncomment this once we can specify granularity in Time Lord.
  # message << TimeLord::Period.new(@pax[:date], Time.now).to_words
  message << pax.time_till
  message << 'from now'

  message << ' (No official date, yet)' if pax.estimated
  message.join(' ')
end

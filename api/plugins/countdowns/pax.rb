# frozen_string_literal: true

require './api/plugins/helpers'
require 'time'

# Class representation of a Pax
class Pax
  attr_accessor :name, :date, :pax_type, :estimated

  def initialize(name, date, pax_type, estimated)
    @name = name.to_s
    @date = Time.parse(date)
    @pax_type = pax_type.to_sym
    @estimated = estimated.to_s == true || estimated.to_s == 'true'
  end

  def time_till
    Helpers.time_format(@date - Time.now, [:days])
  end
end

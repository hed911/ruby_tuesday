require_relative 'ds'
require_relative 'price_calculator'

class Computer
  include PriceCalculator
  PARTS_NAMES = %i(cpu mouse keyboard display)

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(m, *args, &block)
    super unless PARTS_NAMES.include?(m)
    send(:get_price_label, data_source: @data_source, part: m)
  end
end

ds = DS.new
workstation1 = Computer.new(1, ds)
p workstation1.mouse
p workstation1.cpu
p workstation1.keyboard

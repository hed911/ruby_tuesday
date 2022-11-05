module PriceCalculator
  def get_price_label(data_source:, part:)
    info = data_source.send("get_#{part}_info", @id)
    price = data_source.send("get_#{part}_price", @id)
    result = "#{part.upcase}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end 
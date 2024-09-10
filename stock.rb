# Class to handle Stock data
class Stock
  attr_reader :name

  def initialize(name)
    @name = name
    @prices = {}
  end

  # Set stock price by date
  # @param date with format "YYYY-MM-DD" [String]
  # @param price [Float]
  # @return [Float]
  def set_price(date, price)
    @prices[date] = price.to_f
  end

  # Get stock price by date
  # @param date with format "YYYY-MM-DD" [String]
  # @return [Float]
  def price(date)
    @prices[date] || 0.0
  end
end

require './stock'

# Class to handle Portfolio data
class Portfolio
  def initialize
    @stocks = {}
  end

  # Adds a stock to portfolio
  # @param stock [Stock]
  # @param quantity [Integer]
  # @return [Integer]
  def add_stock(stock, quantity)
    @stocks[stock] = quantity
  end

  # Calculates profit by initial and end date
  # @param initial_date with format "YYYY-MM-DD" [String]
  # @param end_date with format "YYYY-MM-DD" [String]
  # @return [Float]
  def profit(initial_date, end_date)
    initial_date_total = stock_total_by_date(initial_date)
    end_date_total = stock_total_by_date(end_date)

    end_date_total - initial_date_total
  end

  private

  def stock_total_by_date(date)
    @stocks.sum { |stock, quantity| stock.price(date) * quantity }
  end
end

initial_date = "2024-01-01"
end_date = "2024-10-01"

stock1 = Stock.new("AAPL")
stock1.set_price(initial_date, 150)
stock1.set_price(end_date, 200)

stock2 = Stock.new("MAC")
stock2.set_price(initial_date, 120)
stock2.set_price(end_date, 100)

stock3 = Stock.new("HP")
stock3.set_price(initial_date, 20)
stock3.set_price(end_date, 100)

portfolio = Portfolio.new
portfolio.add_stock(stock1, 10)
portfolio.add_stock(stock2, 10)
portfolio.add_stock(stock3, 100)

puts portfolio.profit(initial_date, end_date)

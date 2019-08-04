require 'terminal-table'
require 'rainbow'
require 'binance'

module Trading
  class PriceTable
    def initialize
      @table = Terminal::Table.new headings: %w(Pair LastPrice)
      @table.align_column(0,:right)
    end

    def format(pair)
      row = []
      row << Rainbow("#{pair['symbol']}").color(:green)
      row << Rainbow("#{pair['price']}").color(:green)
      @table << row
    end

    def print_to_console
      puts @table.to_s
    end
  end
end

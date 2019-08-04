require "trading/version"
require 'gli'
require 'terminal-table'
require 'rainbow'
require 'binance'

include GLI::App

module Trading
  program_desc 'Support Trading and check coin marketrate via terminal'

  version Trading::VERSION

  desc 'Get prices for all currency pairs on popular exchanges'
  command :price do |c|
    c.switch :d
    c.action do |global_options, options, args|
      client = Binance::Client::REST.new
      coin_name = args[0].upcase
      currency = args[1].upcase if args[1]
      prices = client.price

      if currency
        pair_name = args[0].upcase + args[1].upcase
        coin_currencies = [] << prices.detect { |x| x['symbol'] == pair_name }
      else
        coin_currencies = prices.select { |x| x['symbol'].start_with?(coin_name) }
      end

      @table = Terminal::Table.new headings: %w(Pair LastPrice)
      @table.align_column(0,:right)
      coin_currencies.each do |coin_currency|
        row = []
        row << Rainbow("#{coin_currency['symbol']}").color(:green)
        row << Rainbow("#{coin_currency['price']}").color(:green)
        @table << row
      end
      puts @table.to_s
    end
  end

  exit run(ARGV)
end

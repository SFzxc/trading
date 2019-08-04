require "trading/version"
require 'trading/price_table'
require 'gli'

include GLI::App

module Trading
  program_desc 'Support Trading and check coin marketrate via terminal'

  version Trading::VERSION

  desc 'Get prices for all currency pairs on binance exchanges'
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

      table = Trading::PriceTable.new
      coin_currencies.each do |coin_currency|
        table.format(coin_currency)
      end
      table.print_to_console
    end
  end

  exit run(ARGV)
end

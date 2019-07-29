require "trading/version"
require 'gli'

include GLI::App

module Trading
  program_desc 'Support Trading and check coin marketrate via terminal'

  version Trading::VERSION

  desc 'Get prices for all currency pairs on popular exchanges'
  command :price do |c|
    c.switch :d
    c.action do |global_options, options, args|
      puts "#{args[0]}"
      puts "#{args[1]}"
    end
  end

  exit run(ARGV)
end

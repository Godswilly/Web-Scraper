# ! /usr/bin/env ruby

require_relative '../lib/scraper.rb'

shoes = Shoes.new

puts shoes.scrape

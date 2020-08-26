require 'httparty'
require 'nokogiri'

# class Shoes
class Shoes
  attr_reader :shoes, :url, :parsed_page

  def initialize
    @url = 'https://www.jumia.com.ng/mens-loafers-slip-ons/'
    @shoes = []
    @parsed_page = nil
  end

  def scrape
    @parsed_page = parse_url(@url)
    @parsed_page.css('div.info').each do |shoe_listing|
      shoe = []
      name = shoe_listing.css('h3.name').text
      price = shoe_listing.css('div.prc').text
      discount_price = shoe_listing.css('div.old').text
      rating = shoe_listing.css('div.rev').text
      shoe.push(name, price, discount_price, rating)
      @shoes.push(shoe)
    end
    @shoes
  end

  private

  def parse_url(url)
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page)
  end
end

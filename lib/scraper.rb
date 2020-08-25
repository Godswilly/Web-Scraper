require 'httparty'
require 'nokogiri'
require 'byebug'

class Shoes
  attr_reader :shoes, :url, :parsed_page

  def initialize
    @url = 'https://www.jumia.com.ng/mens-loafers-slip-ons/'
    @shoes = []
    @parsed_page = nil
  end

  def scrape
    @parsed_page = parse_url(@url)
    shoe_listings = @parsed_page.css('div.info') # 48 shoes
    shoe_listings.each do |shoe_listing|
      shoe = {
        name: shoe_listing.css('h3.name').text,
        price: shoe_listing.css('div.prc').text,
        discount_price: shoe_listing.css('div.old').text,
        rating: shoe_listing.css('div.rev').text
      }
      @shoes << shoe
    end
    display(@shoes)
  end

  def display(title)
    title.each { |tit| puts tit }
  end

  private

  def parse_url(url)
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page)
  end
end

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
end
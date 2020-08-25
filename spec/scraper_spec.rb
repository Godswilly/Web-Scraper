require_relative '../lib/scraper.rb'

describe Shoes do
  let(:shoes) { Shoes.new }
  let(:array) { [1, 3, 5] }

  describe '#initialize' do
    it 'initialize url to string value' do
      expect(shoes.url).to be_a(String)
    end
    it 'initialize parsed_page to nil' do
      expect(shoes.parsed_page.nil?).to eql(true)
    end
  end

  describe '#scrape' do
    it 'assigns a value to parse_page' do
      shoes.scrape
      expect(shoes.parsed_page.nil?).to eql(false)
    end
  end

  describe '#display' do
    it 'display all elements in the hash' do
      dis = shoes.display(array)
      expect(dis).to eq(array)
    end
  end
end

require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  it 'exists and readable attributes' do
    market = Market.new("South Pearl Street Farmers Market")

    expect(market).to be_an_instance_of(Market)
    expect(market.name).to eq("South Pearl Street Farmers Market")
    expect(market.vendors).to eq([])
  end

end

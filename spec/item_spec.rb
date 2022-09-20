require 'rspec'
require './lib/item'


RSpec.describe Item do
  it 'exists and has readable attributes' do
    item = Item.new({name: 'Tomato', price: '$0.50'})

    expect(item).to be_an_instance_of Item
    expect(item.name).to eq("Tomato")
    expect(item.price).to eq(0.5)
  end

end

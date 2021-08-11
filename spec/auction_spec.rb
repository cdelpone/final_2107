require 'spec_helper'

RSpec.describe Auction do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
    @auction = Auction.new
  end

  it 'exists and has attributes' do
    expect(@auction).to be_an Auction
    expect(@auction.items).to eq([])
  end

  it 'adds items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq([@item1, @item2])
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end
end

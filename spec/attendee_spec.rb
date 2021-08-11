require 'spec_helper'

RSpec.describe Attendee do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    @auction = Auction.new
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item3.add_bid(@attendee2, 15)
    @item4.add_bid(@attendee3, 50)
  end

  it 'exists and has attributes' do
    expect(@attendee).to be_an Attendee
    expect(@attendee.name).to eq("Megan")
    expect(@attendee.budget).to eq(50)
  end

  it 'items the attendee bid on' do
    expect(@attendee.bid_items).to eq([])
  end
end

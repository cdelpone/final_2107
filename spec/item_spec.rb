require 'spec_helper'

RSpec.describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it 'exists and has attributes' do
    expect(@item1).to be_an Item
    expect(@item1.name).to eq("Chalkware Piggy Bank")
  end
end


# ## Iteration 2 - Bidding!
# Use TDD to update your classes to respond to the following interaction pattern.  Some notes:
# - `unpopular_items` are those items which have no bids.
# - `potential_revenue` is the total possible sale price of the items (the items highest bid)
#
# item1 = Item.new('Chalkware Piggy Bank')
# item2 = Item.new('Bamboo Picture Frame')
# item3 = Item.new('Homemade Chocolate Chip Cookies')
# item4 = Item.new('2 Days Dogsitting')
# item5 = Item.new('Forever Stamps')
# attendee1 = Attendee.new(name: 'Megan', budget: '$50')
# attendee2 = Attendee.new(name: 'Bob', budget: '$75')
# attendee3 = Attendee.new(name: 'Mike', budget: '$100')
# auction = Auction.new
#
# auction.add_item(item1)
# auction.add_item(item2)
# auction.add_item(item3)
# auction.add_item(item4)
# auction.add_item(item5)
#
# expect(item1.bids).to eq({})
#
# item1.add_bid(attendee2, 20)
#
# item1.add_bid(attendee1, 22)
#
# expect(item1.bids).to eq({)
# #     attendee2 ...> => 20,
# #     attendee1 ...> => 22
# #   }
#
# expect(item1.current_high_bid).to eq(22)
#
# item4.add_bid(attendee3, 50)
#
# expect(auction.unpopular_items).to eq([item2 ...>, item3 ...>, item5 ...>])
#
# item3.add_bid(attendee2, 15)
#
# expect(auction.unpopular_items).to eq([item2 ...>, item5 ...>])
#
# expect(auction.potential_revenue).to eq(87)
#
# ## Iteration 3 - More bidding stuff!
#
# Use TDD to update your classes to respond to the following interaction pattern.  Some notes:
# - `bidder_info` should return a hash with keys that are attendees, and values that are a hash with that attendee's budget and an array of items that attendee has bid on.
# - `close_bidding` should update the item so that it will not accept additional bids'
#
# item1 = Item.new('Chalkware Piggy Bank')
# item2 = Item.new('Bamboo Picture Frame')
# item3 = Item.new('Homemade Chocolate Chip Cookies')
# item4 = Item.new('2 Days Dogsitting')
# item5 = Item.new('Forever Stamps')
# attendee1 = Attendee.new(name: 'Megan', budget: '$50')
# attendee2 = Attendee.new(name: 'Bob', budget: '$75')
# attendee3 = Attendee.new(name: 'Mike', budget: '$100')
# auction = Auction.new
# auction.add_item(item1)
# auction.add_item(item2)
# auction.add_item(item3)
# auction.add_item(item4)
# auction.add_item(item5)
# item1.add_bid(attendee1, 22)
# item1.add_bid(attendee2, 20)
# item4.add_bid(attendee3, 50)
# item3.add_bid(attendee2, 15)
#
# expect(auction.bidders).to eq(["Megan", "Bob", "Mike"])
#
# expect(auction.bidder_info).to eq({
#     attendee1 @budget=50, @name="Megan"> =>
#       {
#         :budget => 50,
#         :items => [#<Item:0x00007ff17702e2a0 ...>]
#       },
#     attendee2 @budget=75, @name="Bob"> =>
#       {
#         :budget => 75,
#         :items => [#<Item:0x00007ff17702e2a0...>, #<Item:0x00007ff177ae45f0 ...>]
#       },
#     attendee3 @budget=100, @name="Mike"> =>
#       {
#         :budget => 100,
#         :items => [#<Item:0x00007ff177a9d858...>]
#       }
#    })
#
# expect(item1.bids).to eq({#=> {attendee1 ...> => 22, attendee2 ...> => 20})
#
# item1.close_bidding
#
# item1.add_bid(@attendee3, 70)
#
# expect(item1.bids).to eq({attendee1 ...> => 22, attendee2 ...> => 20})
#
# ## Iteration 4 - Dates ! And closing the auction
#
# Use TDD to update your classes to respond to the following interaction pattern.  Some notes:
# - An Auction will now be created with a date - whatever date the event is created on through the use of `Date.today`. The addition of a date to the event should NOT break any previous tests.  The `date` method will return a string representation of the date - 'dd/mm/yyyy'. We want you to test this in with a date that is IN THE PAST. In order to test the date method in a way that will work today, tomorrow and on any date in the future, you will need to use a stub :)
# - `close_auction` should close bidding and 'sell' items to attendees.  The method will return a hash with items as the keys, and the purchaser of that item as the values. Attendees will only purchase items that they can afford (their bid is less than their current budget).  If an attendee has bid on multiple items, they will purchase the items starting with the most expensive first, followed by the next most expensive, etc... while they still have enough money in their budget to pay for the item.  If the highest bidder for an item does not have enough budget to pay for the item, the next highest bidder will purchase the item.
#
# require 'date'
#
# item1 = Item.new('Chalkware Piggy Bank')
# item2 = Item.new('Bamboo Picture Frame')
# item3 = Item.new('Homemade Chocolate Chip Cookies')
# item4 = Item.new('2 Days Dogsitting')
# item5 = Item.new('Forever Stamps')
# attendee1 = Attendee.new(name: 'Megan', budget: '$50')
# attendee2 = Attendee.new(name: 'Bob', budget: '$75')
# attendee3 = Attendee.new(name: 'Mike', budget: '$100')
# auction = Auction.new
#
# auction.add_item(item1)
# auction.add_item(item2)
# auction.add_item(item3)
# auction.add_item(item4)
# auction.add_item(item5)
#
# expect(auction.date).to eq("24/02/2020")
#
# item1.add_bid(attendee1, 22)
# item1.add_bid(attendee2, 20)
# item4.add_bid(attendee2, 30)
# item4.add_bid(attendee3, 50)
# item3.add_bid(attendee2, 15)
# item5.add_bid(attendee1, 35)
#
# expect(auction.close_auction).to eq({
#   <Item:0x00007f9ea5af30c0 ...> => #<Attendee:0x00007f9ea50c4748 ...>,
#   <Item:0x00007f9ea5a5a190 ...> => 'Not Sold',
#   <Item:0x00007f9ea5910c08 ...> => #<Attendee:0x00007f9ea50c4748 ...>,
#   <Item:0x00007f9ea5c08f00 ...> => #<Attendee:0x00007f9ea50b5b58 ...>,
#   <Item:0x00007f9ea5bc0480 ...> => #<Attendee:0x00007f9ea5b73f40 ...>
# })

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def item_names
    items.map do |item|
      item.name
    end
  end

  def unpopular_items
    items.select do |item|
      item.bids.empty?
    end
  end

  def popular_items
    items.select do |item|
      !item.bids.empty?
    end
  end

  def potential_revenue
    popular_items.sum do |item|
      item.current_high_bid
    end
  end

  def bidders
    bidder_name = []
    popular_items.each do |item|
      item.bids.keys.map do |attendee|
        bidder_name << attendee.name
      end
    end
    bidder_name.uniq
  end

end
# - `bidder_info` should return a hash with keys that are attendees, and values that are a hash with that attendee's budget and an array of items that attendee has bid on.
# - `close_bidding` should update the item so that it will not accept additional bids'

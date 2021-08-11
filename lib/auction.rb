class Auction
  attr_reader :items,
              :popular_items

  def initialize
    @items = []
    @popular_items = popular_items
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
        attendee.bid_items << item
        attendee.bid_items.uniq
      end
    end
    bidder_name.uniq
  end

  def bidder_info
    bidder_info = Hash.new(0)
    popular_items.map do |item|
      item.bids.keys.flatten.map do |attendee|
        bidder_info[attendee] = { budget: attendee.budget, items: attendee.bid_items }
      end
    end
    bidder_info
  end
end

# - `close_bidding` should update the item so that it will not accept additional bids'

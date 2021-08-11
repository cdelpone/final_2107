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

end

class Attendee
  attr_reader :name,
              :budget,
              :bid_items

  def initialize(params)
    @name = params[:name]
    @budget = params[:budget].delete('$').to_f
    @bid_items = []
  end
end
